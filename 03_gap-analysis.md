# Research Step 3: Gap Analysis (Target vs Reference)

## Purpose
Compare the **target service (`embedded-raft-tp`)** with the **reference service (`payment-file-service`)** to identify gaps in cloud readiness.

The goal is to:
- highlight concrete differences in architecture, configuration, and deployment
- identify missing cloud-ready patterns in the target service
- determine areas that will require changes for AWS migration
- provide clear, evidence-based insights for planning

---

## Context

- Target Service: `embedded-raft-tp`
- Reference Service: `payment-file-service`
- Reference service represents AWS-aligned implementation patterns

---

## Instructions for AI

Act as a **Senior Cloud Architect and Migration Specialist**.

Compare both services using actual repository structure and configuration.

Base your analysis on:
- application configuration (`application.yml`, etc.)
- build files (`gradle`/`pom`)
- deployment-related files
- infrastructure definitions (if present)

Avoid generic statements. Use concrete observations wherever possible.

Do NOT generate implementation steps.

---

## Step 1: Deployment Model Comparison

Compare:

- runtime model (Linux/server vs container/cloud)
- startup behavior
- deployment assumptions
- scalability considerations

Clearly state how the target differs from the reference.

---

## Step 2: Configuration Comparison

Compare:

- use of environment variables
- externalization of configuration
- presence of hardcoded values (paths, ports, hosts)
- environment-specific configuration handling

Highlight gaps in:
- flexibility
- environment independence

---

## Step 3: Observability Comparison

Compare:

- logging framework and configuration
- log structure (structured vs unstructured)
- monitoring/metrics integration
- health check endpoints

Identify missing observability capabilities in target service.

---

## Step 4: Dependency Handling Comparison

Compare how both services handle:

- databases
- external APIs
- file system usage
- schedulers / batch jobs
- certificates / keystores

Highlight:
- tightly coupled dependencies
- non-cloud-friendly patterns

---

## Step 5: Infrastructure Alignment

Compare:

- presence of Terraform or IaC
- AWS integration patterns
- IAM/security setup (if visible)
- networking or routing configuration

Identify missing infrastructure alignment in target service.

---

## Step 6: Missing Cloud-Ready Patterns

List patterns present in `payment-file-service` but missing in `embedded-raft-tp`, such as:

- stateless design
- containerization readiness
- externalized configuration
- centralized logging
- health checks (liveness/readiness)
- scalable deployment model

---

## Step 7: Impacted Areas (High-Level)

Identify major areas in target service that will require changes:

- application code
- configuration files
- build/packaging
- deployment setup
- infrastructure

(Do NOT list files here — that will be done in the next step)

---

## Step 8: Gap Severity Assessment

Classify each major gap as:

- High → blocks cloud migration
- Medium → requires change but not blocking
- Low → improvement or optimization

---

## Output Format

Provide response in this structure:

### 1. Comparison Summary
- key differences between target and reference

### 2. Deployment Gaps
- differences in runtime and deployment

### 3. Configuration Gaps
- config-related issues and limitations

### 4. Observability Gaps
- logging/monitoring differences

### 5. Dependency Gaps
- differences in dependency handling

### 6. Infrastructure Gaps
- missing or incomplete AWS/IaC patterns

### 7. Missing Cloud Patterns
- patterns present in reference but absent in target

### 8. Impacted Areas
- high-level areas requiring change

### 9. Gap Severity Summary

| Gap | Severity | Impact |
|-----|----------|--------|

---

## Guardrails

- Do NOT generate implementation steps
- Do NOT suggest code changes
- Avoid generic cloud advice
- Use evidence from repository wherever possible
- Clearly mark unknowns or assumptions

---

## Success Criteria

This step is complete when:

- differences between services are clearly explained
- cloud readiness gaps are concrete and specific
- missing patterns are explicitly listed
- impacted areas are identified
- gap severity is well classified
- output is usable for planning phase
