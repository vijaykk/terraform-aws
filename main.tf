terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.18.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Existing S3 bucket lookup
data "aws_s3_bucket" "target" {
  bucket = var.bucket_name
}

# Zip up the Lambda code
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda"
  output_path = "${path.module}/lambda.zip"
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec" {
  name = "${var.lambda_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = { Service = "lambda.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

# Inline Policy (CloudWatch Logs + limited S3 read)
resource "aws_iam_role_policy" "lambda_inline" {
  name = "${var.lambda_name}-inline"
  role = aws_iam_role.lambda_exec.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid: "Logs",
        Effect: "Allow",
        Action: [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource: "arn:aws:logs:*:*:*"
      },
      {
        Sid: "S3ReadPrefix",
        Effect: "Allow",
        Action: [
          "s3:GetObject",
          "s3:GetObjectTagging",
          "s3:GetObjectAttributes"
        ],
        Resource: "arn:aws:s3:::${var.bucket_name}/${var.prefix}*"
      },
      {
        Sid: "ListBucketPrefix",
        Effect: "Allow",
        Action: ["s3:ListBucket"],
        Resource: data.aws_s3_bucket.target.arn,
        Condition: {
          StringLike: {
            "s3:prefix": "${var.prefix}*"
          }
        }
      }
    ]
  })
}

# Lambda Function
resource "aws_lambda_function" "logger_v2" {
  function_name    = var.lambda_name
  role             = aws_iam_role.lambda_exec.arn
  runtime          = "python3.12"
  handler          = "index.handler"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout     = 10
  memory_size = 128

  environment {
    variables = {
      LOG_LEVEL = "INFO"
    }
  }
}


# Add this to your EventBridge stack (same bucket)
# It ONLY turns on S3→EventBridge; it does NOT create SNS/SQS/Lambda notifications.
resource "aws_s3_bucket_notification" "enable_eventbridge" {
  bucket      = data.aws_s3_bucket.target.id
  eventbridge = true
}

# EventBridge Rule - trigger Lambda for S3 ObjectCreated under prefix
resource "aws_cloudwatch_event_rule" "s3_object_created_prefix" {
  name        = "s3-object-created-${replace(var.bucket_name, ".", "-")}-${replace(var.prefix, "/", "-")}"
  description = "Trigger ${var.lambda_name} when objects created under ${var.bucket_name}/${var.prefix}"

  event_pattern = jsonencode({
    "source": ["aws.s3"],
    "detail-type": ["Object Created"],
    "detail": {
      "bucket": { "name": [var.bucket_name] },
      "object": {
        "key": [{ "prefix": var.prefix }]
      }
    }
  })
}

# Event target
resource "aws_cloudwatch_event_target" "invoke_lambda" {
  rule      = aws_cloudwatch_event_rule.s3_object_created_prefix.name
  target_id = "lambda-${var.lambda_name}"
  arn       = aws_lambda_function.logger_v2.arn
}

# Allow EventBridge to invoke the Lambda
resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge-${var.lambda_name}"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.logger_v2.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.s3_object_created_prefix.arn
}
