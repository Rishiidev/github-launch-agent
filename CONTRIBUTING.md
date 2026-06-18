# Contributing

## What's welcome

- New or improved agent prompts (with output comparison showing the improvement)
- Additional trigger phrases (with test showing the skill activates)
- Better competitor research queries in Agent B (show increased topic hit rate)
- Improvements to the GitHub Pages template (visual quality, accessibility)
- Fixes where a parallel phase accidentally runs sequentially
- Bug fixes where a step produces wrong or empty output

## How to test

Paste `skills/github-launch-agent/SKILL.md` into Claude Code and trigger with
`"agentic github launch"`. Verify:

1. **Phase 1 is parallel**: all 4 agent calls appear in a single response, not one at a time
2. **README has SVG**: `assets/social-preview.svg` appears as the first `<img>` inside the header div
3. **docs/index.html exists** if GitHub Pages was enabled
4. **7-day calendar uses absolute dates** — no relative dates like "Day 1" without a date

## PR format

Every PR must include:
1. Which step or agent changed
2. Before prompt (or behavior) — exact text
3. After prompt (or behavior) — exact text
4. Output comparison showing the improvement

## What must never change

- The `═══ PARALLEL PHASE N ═══` structure — agents in the same phase must remain independent
- The SVG embedding rule: `<img src="assets/social-preview.svg">` is always first in the header div
- The safety check: pipeline stops completely when secrets are found
- SKILL.md is never overwritten if it already exists at the target path

## Start here

See [issue #1](https://github.com/Rishiidev/github-launch-agent/issues/1) for a good first contribution.
