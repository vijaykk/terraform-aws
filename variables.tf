variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "bucket_name" {
  type    = string
  default = "my-unique-s3-bucket-9821"
}

# New prefix (so it’s isolated from your existing bai/)
variable "prefix" {
  type    = string
  default = "bai-eb-v2/"
}

variable "lambda_name" {
  type    = string
  default = "s3-bai-eb-logger-v2"
}
