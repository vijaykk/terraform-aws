# Research Step 2: Reference Service Analysis

## Purpose
This prompt analyzes the **reference service (`payment-file-service`)** to understand cloud-ready patterns already implemented by the team.

The goal is to identify:
- AWS-aligned architecture and deployment patterns
- configuration and environment management practices
- logging, monitoring, and observability setup
- infrastructure and Terraform patterns
- reusable design patterns for other services

This service will be treated as the **baseline for cloud migration**.

---

## Context

- Reference Service: `payment-file-service`
- Deployment: Already in AWS cloud
- Role: Baseline for Core 2 Cloud migration patterns

---

## Instructions for AI

Act as a **Senior Cloud Architect and Platform Engineer**.

Analyze the `payment-file-service` project in the workspace and extract cloud-ready implementation patterns.

Focus on identifying **what makes this service cloud-ready**.

Do NOT generate implementation steps.

---

## Step 1: Service Overview

Identify:
- service purpose
- architecture style (microservice, batch, etc.)
- main entry point
- exposed APIs or workflows

---

## Step 2: Deployment Model

Determine:
- how the service is deployed in AWS
- containerization (Docker usage)
- ECS / Fargate / Kubernetes patterns (if visible)
- any deployment descriptors or configs

Look for:
- Dockerfile
- container configs
- deployment scripts
- environment variables

---

## Step 3: Configuration Management

Analyze:

- `application.yml` / `application.properties`
- environment-specific configs
- use of environment variables
- externalized configuration

Identify:
- separation of config from code
- dynamic configuration patterns

---

## Step 4: Logging and Monitoring

Identify:
- logging framework and configuration
- log format (structured/unstructured)
- integration with monitoring systems
- metrics and observability patterns
- health check endpoints

---

## Step 5: Secrets and Security

Identify:
- how secrets are handled (env variables, vault, etc.)
- certificate or keystore management
- authentication/authorization patterns

---

## Step 6: Infrastructure Patterns

Look for:

- Terraform files
- infrastructure modules
- IAM roles and permissions
- networking configuration
- load balancer or routing setup

---

## Step 7: Build and Packaging

Inspect:
- `build.gradle` or `pom.xml`
- packaging type (jar, container image)
- build plugins related to containerization or deployment

---

## Step 8: Cloud-Ready Patterns

Summarize key patterns such as:

- stateless design
- externalized configuration
- container-first deployment
- centralized logging
- health checks and readiness probes
- scalable deployment model

---

## Output Format

Provide response in this structure:

### 1. Service Summary
- purpose
- architecture overview

### 2. Deployment Model
- how service is deployed in AWS

### 3. Configuration Management
- patterns used

### 4. Logging and Monitoring
- setup and tools

### 5. Secrets and Security
- approach used

### 6. Infrastructure Patterns
- Terraform / AWS setup

### 7. Build and Packaging
- build and deploy approach

### 8. Cloud-Ready Patterns
- reusable best practices

---

## Guardrails

- Do NOT generate implementation steps
- Do NOT modify code
- Do NOT assume missing AWS details
- Clearly state if something is not visible
- Focus only on observed patterns

---

## Success Criteria

This step is complete when:

- cloud deployment model is understood
- configuration patterns are identified
- logging/monitoring approach is captured
- infrastructure patterns are documented
- reusable cloud patterns are clearly summarized
