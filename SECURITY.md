# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this project, please **do not** open a
public issue. Instead, open a [GitHub Issue](https://github.com/Rishiidev/github-launch-agent/issues/new)
with the title prefix `[SECURITY]` — this keeps the report visible to maintainers
while the issue is being resolved.

Please include:
- Description of the vulnerability
- Steps to reproduce
- Potential impact

We aim to respond within 72 hours and resolve confirmed issues within 7 days.

## Scope

This project is a Claude Code skill (prompt-based). Vulnerabilities include:

- Prompt injection vectors in skill inputs
- Instructions that could cause unintended data exposure or deletion
- Safety check bypasses (e.g. skipping the secrets scan in Step 1)
- File-write instructions targeting paths outside the project directory

## Out of Scope

- Issues with Claude itself or the Anthropic API
- GitHub API rate limits or authentication edge cases
- Cosmetic issues (wrong color, typo in output)
