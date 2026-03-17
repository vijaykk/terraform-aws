# Research Step 6: Final Research Summary

## Purpose
This step consolidates all research findings into a structured and readable summary for cloud migration of the target service (`embedded-raft-tp`).

The goal is to:
- present a clear understanding of the current system
- summarize cloud readiness gaps
- highlight impacted areas
- capture risks and open questions
- provide inputs for the planning phase

This is the **final output of the research phase**.

---

## Context

- Target Service: `embedded-raft-tp`
- Reference Service: `payment-file-service`
- Previous Steps:
  - target analysis
  - reference analysis
  - gap analysis
  - impacted files
  - risks and questions

---

## Instructions for AI

Act as a **Senior Cloud Architect**.

Consolidate all research findings into a structured summary.

Focus on clarity, conciseness, and relevance.

Do NOT include implementation steps.

---

## Output Structure

### 1. Service Summary
- purpose of the service
- high-level architecture

---

### 2. Current-State Observations
- key characteristics of current system
- Linux/server-based assumptions

---

### 3. Reference Cloud Patterns
- key patterns observed in `payment-file-service`

---

### 4. Key Cloud Migration Gaps
- summarized top gaps (from Step 3)
- avoid duplication

---

### 5. Impacted Areas
- summarized from Step 4
- group by category (config, code, infra, etc.)

---

### 6. Risks and Open Questions
- summarized from Step 5

---

### 7. Inputs for Planning
- high-level inputs only (NOT steps)
- examples:
  - components requiring change
  - areas needing validation
  - infra considerations

---

## Guardrails

- Do NOT generate implementation steps
- Do NOT suggest specific AWS services
- Avoid repetition
- Keep output concise and structured
- Focus on decision-making clarity

---

## Success Criteria

This step is complete when:

- research findings are clearly summarized
- gaps are easy to understand
- impacted areas are visible
- risks and questions are highlighted
- output is ready for planning phase
