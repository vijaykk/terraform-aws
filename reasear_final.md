Consolidate all previous research outputs into a final structured research summary.

Context:
- Target service: embedded-raft-tp
- Reference service: payment-file-service
- This is part of Core 2 Cloud (C2C) migration
- Research steps already completed:
  1. Target analysis
  2. Reference analysis
  3. Gap analysis
  4. Impacted files identification
  5. Risks and open questions

Instructions:
- Combine all findings into a single coherent document
- Remove duplicates and redundant points
- Prioritize clarity and conciseness
- Keep only the most relevant and impactful insights
- Limit gaps to top 8–10 key items
- Group related items logically
- Ensure output is easy to read by developers and architects

Do NOT:
- generate implementation steps
- suggest specific AWS services
- add new assumptions not present in earlier analysis

Output format:

1. Service Summary
- purpose of the service
- high-level architecture

2. Current-State Observations
- key runtime and deployment characteristics
- Linux/server-based assumptions

3. Reference Cloud Patterns
- key patterns observed in payment-file-service

4. Key Cloud Migration Gaps
- top differences between target and reference
- grouped and prioritized

5. Impacted Areas
- summarize impacted files and components
- group by category (config, code, build, deployment, infrastructure)

6. Risks and Open Questions
- key risks
- unknowns requiring clarification

7. Inputs for Planning
- high-level inputs only (no steps)
- areas requiring change or validation

Important:
- Keep output structured and crisp
- Avoid long paragraphs
- Use bullet points where possible
- Focus on decision-making clarity
