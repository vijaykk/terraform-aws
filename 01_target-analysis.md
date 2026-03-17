# Research Step 1: Target Service Analysis

## Purpose
This prompt analyzes the **target service (`embedded-raft-tp`)** to understand its current architecture, runtime behavior, and dependencies.

The goal is to identify:
- how the service currently operates
- Linux/server-based assumptions
- configuration and infrastructure dependencies
- potential areas impacted by cloud migration

This step focuses ONLY on the target service and does not include comparison with reference services.

---

## Context

- Target Service: `embedded-raft-tp`
- Migration Goal: Linux → AWS Cloud
- Workspace: IntelliJ (multi-module project)

---

## Instructions for AI

Act as a **Senior Cloud Architect and Application Modernization Engineer**.

Analyze the `embedded-raft-tp` project in the workspace and extract detailed information about its current design and behavior.

Do NOT generate implementation steps or code changes.

---

## Step 1: Service Overview

Identify:
- service purpose (based on code and naming)
- key modules and packages
- main entry point (e.g., Spring Boot application class)
- exposed APIs (controllers/endpoints if visible)

---

## Step 2: Runtime and Deployment Model

Determine:
- how the service is expected to run
- whether it assumes a Linux server environment
- startup patterns (scripts, configs, etc.)

Look for:
- shell scripts
- systemd/service configs
- environment variable usage
- JVM options or runtime configs

---

## Step 3: Configuration Analysis

Analyze configuration patterns:

- `application.yml` / `application.properties`
- environment-specific configs
- hardcoded values (host, port, file paths)

Identify:
- environment coupling
- non-externalized configs
- Linux-specific paths

---

## Step 4: Dependency Analysis

Identify dependencies such as:

- databases
- external APIs/services
- file system usage
- schedulers / batch jobs
- certificates / keystores
- caching layers (if any)

Highlight anything tightly coupled to:
- server filesystem
- static infrastructure
- fixed endpoints

---

## Step 5: Logging and Monitoring

Identify:
- logging framework used
- log configuration
- any monitoring or metrics integration
- health check endpoints (if present)

---

## Step 6: Build and Packaging

Inspect:
- `build.gradle` or `pom.xml`
- dependency management
- packaging type (jar/war)
- plugins used

---

## Step 7: Identify Linux-Specific Assumptions

Explicitly call out:

- file system dependencies (e.g., `/tmp`, `/opt`, local storage)
- cron jobs or schedulers tied to server
- hardcoded IPs/hostnames
- reliance on local config files
- startup scripts tied to Linux

---

## Step 8: Identify Cloud Migration Concerns

Based on analysis, identify:

- areas not cloud-ready
- configuration that must be externalized
- dependencies that need rework
- operational concerns for AWS deployment

---

## Output Format

Provide response in this structure:

### 1. Service Summary
- purpose
- architecture overview
- key modules

### 2. Runtime and Deployment Model
- how service runs today
- server assumptions

### 3. Configuration Observations
- config patterns
- issues or risks

### 4. Dependency Analysis
- internal and external dependencies

### 5. Logging and Monitoring
- current setup

### 6. Linux-Specific Assumptions
- explicit list

### 7. Cloud Migration Concerns
- key gaps and risks

---

## Guardrails

- Do NOT generate implementation steps
- Do NOT suggest AWS services yet
- Do NOT modify code
- Clearly state assumptions if uncertain
- Base findings only on visible code/config

---

## Success Criteria

This step is complete when:

- current service behavior is clearly understood
- Linux-specific assumptions are identified
- dependencies are mapped
- initial cloud migration concerns are captured
