# Research Step 5: Risks, Gaps, and Open Questions

## Purpose
This step identifies **risks, unknowns, and open questions** related to migrating the target service (`embedded-raft-tp`) to AWS cloud.

The goal is to:
- highlight uncertainties in the current system
- identify potential blockers or hidden dependencies
- capture areas requiring clarification before planning
- ensure migration decisions are not based on assumptions

This step is strictly part of **research**, not planning or implementation.

---

## Context

- Target Service: `embedded-raft-tp`
- Reference Service: `payment-file-service`
- Previous Steps:
  - target analysis
  - reference analysis
  - gap analysis
  - impacted files

---

## Instructions for AI

Act as a **Senior Cloud Architect and Risk Analyst**.

Analyze the findings from previous steps and identify risks, gaps, and unknowns.

Focus on:
- what is unclear
- what is missing
- what could break during migration
- what needs validation

Do NOT propose solutions or implementation steps.

---

## Step 1: Identify Technical Risks

Identify risks related to:

- runtime behavior
- deployment assumptions
- dependency handling
- configuration management
- environment differences
- scaling or performance

---

## Step 2: Identify Hidden Dependencies

Look for possible hidden or implicit dependencies such as:

- file system reliance
- external services not clearly defined
- environment-specific configurations
- hardcoded endpoints
- certificates or secrets not visible in code

---

## Step 3: Identify Infrastructure Gaps

Identify missing or unclear aspects such as:

- absence of Terraform/IaC
- unclear networking setup
- missing IAM/security context
- unknown load balancing or routing behavior

---

## Step 4: Identify Operational Risks

Identify risks related to:

- logging and monitoring gaps
- lack of health checks
- deployment or rollback uncertainty
- lack of observability

---

## Step 5: Identify Open Questions

List questions that must be clarified before moving to planning:

Examples:
- How is the service currently deployed in production?
- Are there external dependencies not present in code?
- How are secrets managed today?
- Are there scheduled jobs running outside the application?

---

## Output Format

Provide response in this structure:

### 1. Technical Risks
- list of key risks

### 2. Hidden Dependencies
- implicit or unclear dependencies

### 3. Infrastructure Gaps
- missing or unclear infra details

### 4. Operational Risks
- runtime/monitoring concerns

### 5. Open Questions
- items requiring clarification

---

## Guardrails

- Do NOT propose solutions
- Do NOT suggest AWS services
- Do NOT generate implementation steps
- Clearly distinguish between:
  - confirmed observations
  - assumptions
  - unknowns

---

## Success Criteria

This step is complete when:

- major risks are clearly identified
- hidden dependencies are surfaced
- unknowns are explicitly listed
- open questions are actionable
- output helps avoid incorrect assumptions in planning
