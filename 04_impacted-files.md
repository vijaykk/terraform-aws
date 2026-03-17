# Research Step 4: Impacted Files Identification

## Purpose
This step identifies the **exact files and folders in the target service (`embedded-raft-tp`)** that may require updates for AWS cloud migration.

The goal is to:
- translate high-level gaps into concrete file-level impact
- identify where changes are likely required in the codebase
- provide traceability between migration gaps and repository structure

---

## Context

- Target Service: `embedded-raft-tp`
- Reference Service: `payment-file-service`
- Build System: Gradle
- Previous Step: Gap analysis (Step 3)

---

## Instructions for AI

Act as a **Senior Cloud Architect and Codebase Analyst**.

Using the findings from gap analysis, identify specific files and directories in the target service that are likely to be impacted by cloud migration.

Focus on **evidence from the repository**, not assumptions.

**Prioritize analysis of `build.gradle` and `application.yml` as primary configuration sources.**

Do NOT generate implementation steps or code changes.

---

## Step 1: Configuration Files

Identify all configuration-related files, such as:

- `application.yml` / `application.properties`
- environment-specific configs (`application-*.yml`)
- bootstrap configs

Explain:
- what config they contain
- why they may need changes for cloud migration

---

## Step 2: Build and Packaging Files (Gradle)

Inspect:

- `build.gradle`
- `settings.gradle`
- dependency configurations

Identify:
- runtime assumptions
- missing containerization support (if any)
- packaging type (jar, etc.)

---

## Step 3: Application Code Areas

Identify code areas that may be impacted:

- controllers / APIs
- service layer
- file handling logic
- scheduler / batch jobs
- configuration classes

Focus on:
- file system usage
- hardcoded values
- environment-specific logic

---

## Step 4: Deployment and Runtime Files

Look for:

- shell scripts
- startup scripts
- Linux-specific service configs
- environment variable files

Explain:
- how they are used today
- why they may not work in cloud environment

---

## Step 5: Infrastructure and Pipeline Files

Identify:

- Terraform files (if present)
- CI/CD pipeline configs (Jenkins, GitHub Actions)
- deployment scripts

Highlight:
- missing or incomplete infrastructure definitions
- gaps compared to reference service

---

## Step 6: Logging and Monitoring Configs

Identify:

- logging configuration files
- monitoring setup (if any)
- health check implementation

---

## Step 7: Group Impacted Files

Group findings into categories:

- Configuration
- Code
- Build (Gradle)
- Deployment
- Infrastructure

---

## Output Format

Provide response in this table:

| File/Path | Category | Why Impacted | Related Gap |
|----------|----------|-------------|------------|

Followed by:

### Summary
- total number of impacted areas
- most critical file categories
- patterns observed

---

## Guardrails

- Do NOT generate implementation steps
- Do NOT suggest code changes
- Do NOT assume files that do not exist
- Use actual file paths where possible
- Avoid generic statements

---

## Success Criteria

This step is complete when:

- impacted files are clearly listed with paths
- each file has a clear reason for impact
- mapping between gaps and files is visible
- output is specific and actionable
