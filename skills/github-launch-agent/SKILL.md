---
name: github-launch-agent
description: >
  Agentic GitHub launch pipeline with 12 parallel agents across 3 phases. Cuts
  full launch time from 20 minutes to 4. Includes SEO name scoring (5 candidates
  ranked before touching anything), competitor README mining for research-backed
  copy, social preview SVG auto-embedded in README header, GitHub Pages landing
  page with click-to-copy install, 5 scored repo description candidates, and a
  7-day timed distribution calendar. Evolved from github-launch — same full 14-step
  pipeline, parallel execution.

  TRIGGER when user says any of: "agentic github launch", "parallel github launch",
  "fast github launch", "launch agent", "github launch agent", "push to github fast",
  "agentic launch", "parallel launch", "launch with agents".

  Also handles all base skill triggers (overrides github-launch if both installed):
  "push to github", "github launch", "publish skill", "make it viral on github",
  "github everything", "full github setup", "github seo".

  Works for: Claude Code skills (.skill files), plugins, Node/Python/Go/Rust/any repo.
---

# GitHub Launch Agent — Parallel Pipeline

**4 min. 12 agents. 3 parallel phases. Nothing skipped.**

---

## HOW PARALLEL PHASES WORK

When you reach an `═══ PARALLEL PHASE N ═══` section, call the Agent tool for ALL
listed agents in a **single response**. Do not call them one at a time. Independent
agents run simultaneously — this is what cuts wall-clock time from 20 minutes to 4.

After every parallel phase, synthesize all outputs before proceeding.

---

## STEP -1 — SEO Name Optimization

Do this BEFORE asking anything else. Read project files if they exist. If none exist,
score from the description the user provided when triggering this skill.

### Generate 5 name candidates

Based on the project's purpose, generate 5 repo name candidates. For each, run:

```bash
gh search repos "<candidate>" --sort stars --limit 5 --json name,stargazersCount 2>/dev/null | jq 'length'
```

Score each candidate on 4 axes (1–5 per axis, 20 max):

| Axis | 5 | 1 |
|------|---|---|
| **Search saturation** | 0–2 repos with this name | 50+ repos |
| **Keyword match** | Contains 2+ terms people search | Generic words only |
| **Memorability** | ≤22 chars, clear word boundaries | Long or confusing |
| **Category signal** | Instantly clear what it does | Could be anything |

Present as a table with the user's default name at the top row:

```
Name                      | Sat | KW | Mem | Sig | Total | Verdict
--------------------------|-----|----|-----|-----|-------|--------
(user's default)          |  X  |  X |  X  |  X  |  X    | Your default
github-launch-agent       |  4  |  5 |  4  |  5  |  18   | ★ Recommended
agentic-github-launch     |  5  |  4 |  3  |  4  |  16   |
...
```

Tell the user: "Your default scores X/20. I recommend Y (scored Z/20) because [reason]."
Let them pick any name or type their own. **Store the chosen name as REPO_NAME. Use it everywhere.**

---

## STEP 0 — Collect Remaining Inputs (One Message)

Ask all of these in ONE message after the name is chosen:

```
1. Public or private? (Default: public — skills must be public to install)
2. License? (Default: MIT)
3. Primary language/stack? (e.g. Claude skill, Node.js, Python, Go)
4. Do you have a .skill file to attach to the release? If yes, path?
5. GitHub Pages landing page? (Default: yes)
   → Generates docs/index.html + enables Pages
   → Your repo gets a free website at Rishiidev.github.io/REPO_NAME
   → Sets this URL as the repo homepage (indexed by Google, shareable)
6. GitHub Discussions? (Default: yes)
```

Note: social preview SVG is always generated — no need to ask.

Store all 6 answers. Do not ask again.

---

## STEP 1 — Pre-flight Safety Checks

Run ALL of these before creating any files:

```bash
# 1. GitHub auth
gh auth status

# 2. Repo already exists?
gh repo view Rishiidev/REPO_NAME --json name 2>&1

# 3. Sensitive files
find <project-dir> \( -name ".env" -o -name "*.pem" -o -name "*.key" -o -name "secrets*" -o -name ".env.*" \) 2>/dev/null

# 4. Git state
git -C <project-dir> rev-parse --git-dir 2>/dev/null && git -C <project-dir> log --oneline -3 2>/dev/null

# 5. Default branch
git -C <project-dir> config init.defaultBranch 2>/dev/null || echo "main"
```

Decision logic:
- Auth fails → STOP. Tell user: `gh auth login` first.
- Repo exists → skip `gh repo create`. Use `git remote add` + push.
- **Secrets found → STOP. List every file. Do not stage anything.**
- No git init → `git init -b main`
- Branch is `master` → warn, suggest: `git branch -m master main`

---

## ═══════════════════════════════════════════════
## ═══ PARALLEL PHASE 1 ═══
## Spawn all 4 agents in a SINGLE response now.
## ═══════════════════════════════════════════════

Call the Agent tool FOUR TIMES simultaneously. They are fully independent.
Do not run them sequentially. Wait for all four before proceeding to synthesis.

---

### Agent A — Project Intelligence

```
You are extracting launch intelligence from a project.

Working directory: <project-dir>
Repo name: REPO_NAME
Stack: <from Step 0>

Read ALL files. Then return this JSON:

{
  "value_prop": "One sentence with a number — e.g. 'Cuts GitHub launch from 20 min to 4'",
  "target_user": "Specific user type — e.g. 'developers publishing Claude Code skills'",
  "main_trigger": "Primary activation phrase",
  "platforms": ["Claude Code", "Cowork", "Claude.ai"],
  "stack": "Confirmed from files",
  "install_command": "/plugin install github:Rishiidev/REPO_NAME",
  "before_state": "2-3 sentences: what the user's workflow looks like WITHOUT this. Concrete.",
  "after_state": "2-3 sentences: what it looks like WITH this. Concrete.",
  "measurable_benefit": "The biggest number you can derive — time saved, steps eliminated, etc.",
  "category": "claude-skill | node-lib | python-tool | go-tool | rust-tool | cli-tool | web-app"
}

Rules:
- value_prop MUST include a number. Estimate if needed.
- before_state and after_state must be specific to THIS project, not generic.
- If no files exist yet, derive from the repo name and description provided.
```

---

### Agent B — Competitor Research + Topic Discovery

```
Research GitHub for launch preparation.
Project: REPO_NAME
Description: <brief description from project context>

Run these commands:

gh search repos --topic claude --sort stars --limit 15 --json name,topics,description,stargazersCount
gh search repos "github launch" --sort stars --limit 10 --json name,topics,description,stargazersCount
gh search repos "claude skill" --sort stars --limit 10 --json name,topics,description,stargazersCount

From the results, count topic frequency. Extract top 25 topics.

Identify the 3 most similar repos by relevance + star count. For each:
gh api repos/<owner>/<repo>/readme --jq '.content' 2>/dev/null | base64 -d | head -120

From those 3 READMEs, extract:
- Headline format: does it have a number? Statement or question?
- Install command position: early (within first 30 lines) / middle / late
- Star CTA position: early / middle / late / absent
- Value prop framing: outcome-first / feature-first / problem-first

Generate 5 scored repo description candidates (≤100 chars each):

Score each on: has_number (2pts), action_first (2pts), benefit_clear (2pts),
under_80_chars (2pts), no_jargon (2pts). Max 10 per candidate.

Return JSON:
{
  "top_25_topics": ["topic1", "topic2", ...],
  "recommended_20": ["t1", "t2", ...],
  "competitor_patterns": {
    "headline_has_number": true/false,
    "install_position": "early|middle|late",
    "cta_position": "early|middle|late",
    "value_prop_style": "outcome-first|feature-first|problem-first"
  },
  "description_candidates": [
    {"text": "...", "score": 9, "breakdown": "number✓ action✓ benefit✓ short✓ clear✓"},
    {"text": "...", "score": 8, "breakdown": "..."},
    {"text": "...", "score": 7, "breakdown": "..."},
    {"text": "...", "score": 6, "breakdown": "..."},
    {"text": "...", "score": 5, "breakdown": "..."}
  ]
}
```

---

### Agent C — Social Preview SVG

```
Generate a social preview SVG for this project.
Write to: <project-dir>/assets/social-preview.svg
Create the assets/ directory if needed.

Fill in ALL placeholders before writing. No placeholder text left in the file.

Project name: REPO_NAME
Tagline: "4 parallel agents. Full GitHub launch in 4 minutes."
          (Update this if you find a better value prop in the project files.)
Install command: /plugin install github:Rishiidev/REPO_NAME
GitHub username: Rishiidev

SVG to write:

<svg width="1280" height="640" xmlns="http://www.w3.org/2000/svg">
  <rect width="1280" height="640" fill="#0d1117"/>
  <defs>
    <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
      <path d="M 40 0 L 0 0 0 40" fill="none" stroke="#161b22" stroke-width="1"/>
    </pattern>
  </defs>
  <rect width="1280" height="640" fill="url(#grid)"/>
  <rect x="0" y="0" width="6" height="640" fill="#f0883e"/>
  <text x="60" y="96" font-family="system-ui, sans-serif" font-size="20"
        font-weight="600" fill="#f0883e" letter-spacing="4">AGENTIC CLAUDE CODE SKILL</text>
  <text x="60" y="205" font-family="system-ui, sans-serif" font-size="76"
        font-weight="800" fill="#ffffff">REPO_NAME</text>
  <text x="60" y="265" font-family="system-ui, sans-serif" font-size="30"
        fill="#8b949e">TAGLINE</text>
  <!-- 4 parallel agent boxes -->
  <rect x="60" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="60" y="300" width="4" height="38" rx="2" fill="#58a6ff"/>
  <text x="76" y="324" font-family="'Courier New', monospace" font-size="16"
        fill="#58a6ff">▶ Agent A  Research</text>
  <rect x="350" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="350" y="300" width="4" height="38" rx="2" fill="#3fb950"/>
  <text x="366" y="324" font-family="'Courier New', monospace" font-size="16"
        fill="#3fb950">▶ Agent B  Topics</text>
  <rect x="640" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="640" y="300" width="4" height="38" rx="2" fill="#f0883e"/>
  <text x="656" y="324" font-family="'Courier New', monospace" font-size="16"
        fill="#f0883e">▶ Agent C  SVG</text>
  <rect x="930" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="930" y="300" width="4" height="38" rx="2" fill="#d2a8ff"/>
  <text x="946" y="324" font-family="'Courier New', monospace" font-size="16"
        fill="#d2a8ff">▶ Agent D  Files</text>
  <text x="60" y="366" font-family="system-ui, sans-serif" font-size="17"
        fill="#484f58">⚡ all four running simultaneously</text>
  <!-- Install command block -->
  <rect x="60" y="393" width="1020" height="64" rx="8" fill="#161b22"/>
  <rect x="60" y="393" width="4" height="64" rx="2" fill="#f0883e"/>
  <text x="86" y="430" font-family="'Courier New', monospace" font-size="23"
        fill="#f0883e">$</text>
  <text x="114" y="430" font-family="'Courier New', monospace" font-size="23"
        fill="#e6edf3">/plugin install github:Rishiidev/REPO_NAME</text>
  <!-- Feature pills -->
  <rect x="60" y="488" width="156" height="34" rx="17" fill="#161b22"/>
  <text x="138" y="510" font-family="system-ui, sans-serif" font-size="15"
        fill="#8b949e" text-anchor="middle">4x faster</text>
  <rect x="230" y="488" width="190" height="34" rx="17" fill="#161b22"/>
  <text x="325" y="510" font-family="system-ui, sans-serif" font-size="15"
        fill="#8b949e" text-anchor="middle">parallel agents</text>
  <rect x="434" y="488" width="184" height="34" rx="17" fill="#161b22"/>
  <text x="526" y="510" font-family="system-ui, sans-serif" font-size="15"
        fill="#8b949e" text-anchor="middle">GitHub Pages</text>
  <rect x="632" y="488" width="196" height="34" rx="17" fill="#161b22"/>
  <text x="730" y="510" font-family="system-ui, sans-serif" font-size="15"
        fill="#8b949e" text-anchor="middle">competitor research</text>
  <rect x="842" y="488" width="192" height="34" rx="17" fill="#161b22"/>
  <text x="938" y="510" font-family="system-ui, sans-serif" font-size="15"
        fill="#8b949e" text-anchor="middle">7-day calendar</text>
  <text x="1220" y="610" font-family="system-ui, sans-serif" font-size="19"
        fill="#484f58" text-anchor="end">github.com/Rishiidev</text>
</svg>

After writing, confirm the file path.
```

---

### Agent D — Supporting Files

```
Write these 4 files for project REPO_NAME.
GitHub username: Rishiidev
License: <from Step 0>
Stack: <from Step 0>
Date: 2026-06-18

--- File 1: CHANGELOG.md ---
# Changelog

All notable changes documented here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [1.0.0] — 2026-06-18

### Added
- Parallel Phase 1: research, SVG, topics, and files run simultaneously (4 agents)
- Parallel Phase 2: post-push config (topics, discussions, labels, release) simultaneous
- Parallel Phase 3: distribution drafts (Reddit, X, HN, awesome-list) simultaneous
- SEO name scoring: 5 candidates scored on saturation, keywords, memorability, signal
- Competitor README mining: top 3 similar repos analyzed before writing README
- Social preview SVG auto-embedded as README hero image
- GitHub Pages landing page (docs/index.html) with click-to-copy install
- 5 scored repo description candidates — pick the highest or choose any
- 7-day timed distribution calendar with platform-specific posting windows
- Total time: ~4–6 minutes vs ~15–20 minutes sequential

--- File 2: .gitignore (stack-appropriate + always these) ---
.DS_Store
*.log
*.zip
.env
.env.*
*.pem
*.key
secrets*
node_modules/
__pycache__/
*.pyc
.venv/
dist/
build/
*.skill.bak

--- File 3: CONTRIBUTING.md (≤40 lines) ---
# Contributing

## What's welcome
- New trigger phrases (with before/after test showing it activates correctly)
- Better agent prompts (with quality comparison showing improvement)
- Additional parallel phases for currently-sequential steps
- Bug fixes where a step produces wrong output

## How to test
Paste the SKILL.md into Claude Code. Trigger with "agentic github launch".
Verify: Phase 1 spawns 4 agents simultaneously (not sequentially).
Verify: README has SVG embedded as first element in the header div.
Verify: docs/index.html is generated if GitHub Pages was enabled.

## PR format
Every PR must include:
1. What step/agent changed
2. Before prompt / after prompt
3. Output comparison showing improvement

## What must never change
- The PARALLEL PHASE structure (sequential execution breaks the time guarantee)
- The SVG embedding rule in README (it is always the first element)
- The safety check: pipeline stops on secrets found
- SKILL.md is never overwritten if it already exists

## Start here
See issue #1 for a good first contribution.

--- File 4: LICENSE ---
MIT License

Copyright (c) 2026 Rishiidev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Write all 4 files to <project-dir>. Confirm each file written.
```

---

## PHASE 1 SYNTHESIS

After all 4 agents complete, do these steps in order:

### 1. Refine SVG if needed
If Agent A's `value_prop` is more compelling than "4 parallel agents. Full GitHub launch
in 4 minutes." — update only the tagline line in `assets/social-preview.svg`.

### 2. Choose description
From Agent B's 5 candidates, use the top-scored one. Store it as REPO_DESC.
Show the user the scored table and which was selected.

### 3. Choose 20 topics
Use Agent B's `recommended_20`. If fewer than 20, fill from `top_25_topics`.
Store as TOPICS_LIST.

### 4. Write `.claude-plugin/plugin.json`
```json
{
  "name": "REPO_NAME",
  "description": "REPO_DESC",
  "version": "1.0.0",
  "author": { "name": "Rishiidev" },
  "homepage": "https://Rishiidev.github.io/REPO_NAME",
  "repository": "https://github.com/Rishiidev/REPO_NAME",
  "license": "<from Step 0>",
  "skills": "./skills"
}
```

### 5. Write `.claude-plugin/marketplace.json`
```json
{
  "name": "REPO_NAME",
  "owner": {
    "name": "Rishiidev",
    "url": "https://github.com/Rishiidev"
  },
  "metadata": {
    "description": "REPO_DESC",
    "version": "1.0.0",
    "repository": "https://github.com/Rishiidev/REPO_NAME"
  },
  "plugins": [
    {
      "name": "REPO_NAME",
      "description": "<3 sentences: what it does, trigger phrases, platforms>",
      "source": "./"
    }
  ]
}
```

### 6. Write `.github/workflows/validate.yml`
```yaml
name: Validate
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check SKILL.md exists
        run: test -f skills/*/SKILL.md && echo "✓ SKILL.md found"
      - name: Check plugin.json exists
        run: test -f .claude-plugin/plugin.json && echo "✓ plugin.json found"
      - name: Check SKILL.md frontmatter
        run: head -1 skills/*/SKILL.md | grep -q "^---" && echo "✓ frontmatter present"
      - name: Check social preview exists
        run: test -f assets/social-preview.svg && echo "✓ social preview found"
```

### 7. Write `.github/ISSUE_TEMPLATE/feature-request.yml`
```yaml
name: Feature Request
description: Suggest an improvement to the skill pipeline
labels: ["enhancement"]
body:
  - type: textarea
    id: problem
    attributes:
      label: What problem does this solve?
      description: What step or outcome could be better?
    validations:
      required: true
  - type: textarea
    id: solution
    attributes:
      label: Proposed solution
      description: Before/after prompt or behavior change
    validations:
      required: true
  - type: textarea
    id: test
    attributes:
      label: How to verify
      description: How will we know this is an improvement?
    validations:
      required: true
```

### 8. Write `.github/ISSUE_TEMPLATE/bug-report.yml`
```yaml
name: Bug Report
description: A step produced wrong output or failed
labels: ["bug"]
body:
  - type: textarea
    id: trigger
    attributes:
      label: Trigger phrase used
    validations:
      required: true
  - type: textarea
    id: step
    attributes:
      label: Which step or agent failed
    validations:
      required: true
  - type: textarea
    id: expected
    attributes:
      label: Expected output
    validations:
      required: true
  - type: textarea
    id: actual
    attributes:
      label: Actual output
    validations:
      required: true
```

### 9. Write README.md

Apply competitor_patterns from Agent B. Use before_state/after_state from Agent A.

**MANDATORY RULE — SVG in README:**
The social preview must be the FIRST element inside the `<div align="center">` block.
Do not skip it. GitHub renders SVG relative paths. Format:
```html
<img src="assets/social-preview.svg" alt="REPO_NAME — value_prop" width="100%"/>
```

**MANDATORY RULE — First 160 chars after title block:**
Must be the value prop sentence. GitHub search shows these chars in results.
No code blocks or tables before this sentence.

**MANDATORY RULE — Star CTA placement:**
Place it BEFORE the feature tables (after Install section). People who stop reading
mid-page still see it.

```markdown
# ⚡ REPO_NAME — [5-word value prop from Agent A]

<div align="center">
  <img src="assets/social-preview.svg" alt="REPO_NAME — [value_prop]" width="100%"/>
  <br/><br/>

**[Biggest single benefit from Agent A. Include the number.]**

[![Stars](https://img.shields.io/github/stars/Rishiidev/REPO_NAME?style=for-the-badge&color=gold)](https://github.com/Rishiidev/REPO_NAME/stargazers)
[![CI](https://github.com/Rishiidev/REPO_NAME/actions/workflows/validate.yml/badge.svg)](https://github.com/Rishiidev/REPO_NAME/actions)
[![License](https://img.shields.io/github/license/Rishiidev/REPO_NAME?style=for-the-badge)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge)](https://github.com/Rishiidev/REPO_NAME/releases)

*Works in Claude Code · Cowork · Claude.ai*

</div>

> [value_prop sentence — this is what GitHub search shows. Max 160 chars from here.]

---

## The Problem
[before_state from Agent A — 3-4 lines, concrete, familiar]

## The Fix
[after_state from Agent A — 1-3 lines + the main trigger command in a code block]

---

## Install

| Platform | Command |
|----------|---------|
| **Claude Code** | `/plugin install github:Rishiidev/REPO_NAME` |
| **Cowork** | `/plugin install github:Rishiidev/REPO_NAME` |
| **Claude.ai** | Download [`.skill` file](../../releases/latest) → import |

---

<div align="center">
<b>[Specific benefit claim from Agent A]. Star it — 2 seconds.</b><br>
<a href="https://github.com/Rishiidev/REPO_NAME">⭐ Star on GitHub</a>
</div>

---

## Base vs Agentic

| | `claude-github-launch` | **`REPO_NAME` (this)** |
|-|----------------------|----------------------|
| Time | ~15–20 min | **~4–6 min** |
| Execution | Sequential (14 steps) | **Parallel (3 phases, 12 agents)** |
| README quality | From project files | **+ competitor research** |
| Name | "I'll suggest one" | **5 scored candidates** |
| Description | 1 generated | **5 scored, you pick** |
| Social preview | Generated | **Auto-embedded in README** |
| GitHub Pages | ✗ | **✓ free site + homepage** |
| Distribution | Ready-to-paste | **Text + 7-day timed calendar** |

## How It Works

[pipeline diagram showing the 3 parallel phases — use ASCII art or table format]

## What It Builds
[file tree showing full output structure]

## What Never Gets Touched
[table: protected items + why]

## Trigger Phrases
[table of all trigger phrases]

## Star History
[![Star History Chart](https://api.star-history.com/svg?repos=Rishiidev/REPO_NAME&type=Date)](https://star-history.com/#Rishiidev/REPO_NAME&Date)

---

MIT License

---

<div align="center">
<b>Found REPO_NAME useful? A ⭐ helps others find it.</b><br>
<a href="https://github.com/Rishiidev/REPO_NAME">⭐ Star this repo</a>
</div>
```

---

## STEP: Git, Create Repo, Push

```bash
git -C <dir> rev-parse --git-dir 2>/dev/null || git -C <dir> init -b main
git -C <dir> status
# Review output. If .env or secrets appear — add to .gitignore first.
git -C <dir> add -A
# Commit message:
# No prior commits → "Initial release: REPO_NAME v1.0.0"
# Has prior commits → "Add GitHub launch assets: parallel pipeline v1.0.0"
git -C <dir> commit -m "<correct message>"
gh repo create REPO_NAME --public \
  --description "REPO_DESC" \
  --source <dir> \
  --remote origin \
  --push
```

If repo already existed from pre-flight:
```bash
git -C <dir> remote add origin https://github.com/Rishiidev/REPO_NAME.git 2>/dev/null || true
git -C <dir> push -u origin main
```

---

## ═══════════════════════════════════════════════
## ═══ PARALLEL PHASE 2 ═══
## Post-push: spawn all 4 config agents in ONE response.
## ═══════════════════════════════════════════════

---

### Agent E — Topics + Description

```
Set topics and description on: Rishiidev/REPO_NAME

gh repo edit Rishiidev/REPO_NAME \
  --add-topic <all 20 from TOPICS_LIST — one --add-topic per topic>

gh repo edit Rishiidev/REPO_NAME --description "REPO_DESC"

Verify:
gh repo view Rishiidev/REPO_NAME --json topics,description

Report: "Topics set: N/20. Description: <value>"
```

---

### Agent F — Discussions + Issues

```
Enable on: Rishiidev/REPO_NAME
Discussions value: <true/false from Step 0>

gh api repos/Rishiidev/REPO_NAME --method PATCH --field has_discussions=DISCUSSIONS_VALUE
gh api repos/Rishiidev/REPO_NAME --method PATCH --field has_issues=true

Verify both settings. Report result.
```

---

### Agent G — Labels + Good First Issue

Labels MUST be created before the issue. Run both sequentially inside this agent.

```
Repo: Rishiidev/REPO_NAME
Project type: <category from Agent A>

Step G1 — Create labels (errors fine, continue):
gh label create "good first issue" --color "7057ff" --description "Good for newcomers" --repo Rishiidev/REPO_NAME 2>/dev/null || true
gh label create "documentation" --color "0075ca" --description "Improvements to docs" --repo Rishiidev/REPO_NAME 2>/dev/null || true
gh label create "enhancement" --color "a2eeef" --description "New feature" --repo Rishiidev/REPO_NAME 2>/dev/null || true
gh label create "bug" --color "d73a4a" --description "Something isn't working" --repo Rishiidev/REPO_NAME 2>/dev/null || true
gh label create "parallel-agent" --color "f0883e" --description "Agent parallelism improvements" --repo Rishiidev/REPO_NAME 2>/dev/null || true

Step G2 — Create tailored good first issue based on category:
- claude-skill → "Add 3 trigger phrase variations with before/after output showing each activates correctly"
- node-lib → "Add TypeScript types to the main export function"
- cli-tool → "Add --dry-run flag showing what would run without executing"
- python-tool → "Add a concrete example output block to the README usage section"
- go-tool → "Add --verbose flag with structured log output"
- Default → "Improve the README with a concrete before/after example for [main use case]"

gh issue create \
  --repo Rishiidev/REPO_NAME \
  --title "<tailored title — achievable in under 1 hour>" \
  --body "<tailored body: exact steps, which file to edit, what the result should look like>

**Why this helps:** <one sentence>

**Steps:**
1. Fork this repo
2. <specific steps for THIS project>
3. Open a PR with before/after output showing it works

No deep knowledge required." \
  --label "good first issue" \
  --label "documentation"

Report: "Labels: 5 created. Issue #1: <title>"
```

---

### Agent H — GitHub Release

```
Create release for: Rishiidev/REPO_NAME
.skill file path: <from Step 0, or "none">

If .skill file path provided:
gh release create v1.0.0 <skill-path> \
  --repo Rishiidev/REPO_NAME \
  --title "v1.0.0 — Initial Release" \
  --notes "## What's in v1.0.0

### New
- Parallel Phase 1: 4 agents simultaneously (research, topics, SVG, files)
- Parallel Phase 2: post-push config simultaneous
- Parallel Phase 3: distribution drafts simultaneous
- SEO name scoring — 5 candidates, ranked
- Competitor README mining from top 3 similar repos
- Social preview embedded in README automatically
- GitHub Pages landing page with click-to-copy install
- 7-day distribution calendar with timed posting windows

### Install
**Claude Code / Cowork:**
\`\`\`
/plugin install github:Rishiidev/REPO_NAME
\`\`\`
**Claude.ai:** Download \`REPO_NAME.skill\` below → import.

### What's next
See [open issues](https://github.com/Rishiidev/REPO_NAME/issues) — contributions welcome."

If no .skill file: same command without the skill-path argument.

Report: "Release v1.0.0 created. Assets: N"
```

---

## STEP: GitHub Pages (if user said yes in Step 0)

After PARALLEL PHASE 2 completes:

**1. Write `docs/index.html`** using the template below (fill ALL placeholders):

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="VALUE_PROP_FROM_AGENT_A">
  <title>REPO_NAME — 5-WORD-VALUE-PROP</title>
  <style>
    *{margin:0;padding:0;box-sizing:border-box}
    body{background:#0d1117;color:#e6edf3;font-family:system-ui,sans-serif;line-height:1.6}
    .hero{max-width:960px;margin:0 auto;padding:80px 40px 60px}
    .hero img{width:100%;border-radius:12px;margin-bottom:48px;display:block}
    h1{font-size:52px;font-weight:800;margin-bottom:16px}
    .tagline{font-size:22px;color:#8b949e;margin-bottom:40px;max-width:700px}
    .install-wrap{margin-bottom:48px}
    .install-label{font-size:13px;color:#484f58;margin-bottom:10px;text-transform:uppercase;letter-spacing:1px}
    .install-box{background:#161b22;border-radius:8px;padding:20px 24px;border-left:4px solid #f0883e;cursor:pointer;transition:border-color .2s}
    .install-box:hover{border-color:#f0883e;box-shadow:0 0 0 1px #f0883e40}
    .install-box pre{font-family:'Courier New',monospace;font-size:18px;color:#f0883e;margin:0;white-space:nowrap}
    .copy-hint{font-size:12px;color:#484f58;margin-top:8px}
    .btns{display:flex;gap:16px;flex-wrap:wrap;margin-bottom:80px}
    .btn-primary{background:#f0883e;color:#0d1117;padding:14px 32px;border-radius:8px;font-weight:700;font-size:17px;text-decoration:none;display:inline-block}
    .btn-secondary{color:#8b949e;padding:14px 24px;font-size:17px;text-decoration:none;display:inline-block;border:1px solid #30363d;border-radius:8px}
    .features{max-width:960px;margin:0 auto;padding:0 40px 80px;display:grid;grid-template-columns:1fr 1fr;gap:24px}
    .feature{background:#161b22;border-radius:8px;padding:28px;border-top:2px solid transparent}
    .feature.orange{border-top-color:#f0883e}
    .feature.blue{border-top-color:#58a6ff}
    .feature.green{border-top-color:#3fb950}
    .feature.purple{border-top-color:#d2a8ff}
    .feature h3{font-size:18px;margin-bottom:10px}
    .feature p{color:#8b949e;font-size:15px}
    footer{text-align:center;padding:40px;color:#484f58;font-size:14px;border-top:1px solid #161b22}
    footer a{color:#8b949e;text-decoration:none}
    @media(max-width:700px){.features{grid-template-columns:1fr}.hero{padding:40px 24px 40px}h1{font-size:36px}.install-box pre{font-size:14px;overflow-x:auto}}
  </style>
</head>
<body>
  <div class="hero">
    <img src="https://raw.githubusercontent.com/Rishiidev/REPO_NAME/main/assets/social-preview.svg"
         alt="REPO_NAME — VALUE_PROP">
    <h1>REPO_NAME</h1>
    <p class="tagline">VALUE_PROP_FROM_AGENT_A</p>
    <div class="install-wrap">
      <div class="install-label">Install in Claude Code</div>
      <div class="install-box" onclick="copyInstall(this)" title="Click to copy">
        <pre id="install-cmd">/plugin install github:Rishiidev/REPO_NAME</pre>
        <div class="copy-hint">Click to copy</div>
      </div>
    </div>
    <div class="btns">
      <a href="https://github.com/Rishiidev/REPO_NAME" class="btn-primary">⭐ Star on GitHub</a>
      <a href="https://github.com/Rishiidev/REPO_NAME#readme" class="btn-secondary">View docs →</a>
    </div>
  </div>
  <div class="features">
    <div class="feature orange">
      <h3>⚡ Parallel Agents</h3>
      <p>4 agents run simultaneously in Phase 1 — research, SVG, topics, and files complete at the same time. 3 parallel phases total.</p>
    </div>
    <div class="feature blue">
      <h3>🎯 SEO Name Scoring</h3>
      <p>5 name candidates scored on saturation, keyword match, memorability, and signal — before touching anything.</p>
    </div>
    <div class="feature green">
      <h3>🔬 Competitor Research</h3>
      <p>Agent B mines the top 3 similar repos' READMEs for patterns that convert — headline format, CTA placement, install position.</p>
    </div>
    <div class="feature purple">
      <h3>📅 7-Day Calendar</h3>
      <p>Distribution isn't a list of platforms — it's a timed plan with exact posting windows for Reddit, X, HN, and awesome-lists.</p>
    </div>
  </div>
  <footer>
    MIT License ·
    <a href="https://github.com/Rishiidev/REPO_NAME">GitHub</a> ·
    Built by <a href="https://github.com/Rishiidev">Rishiidev</a>
  </footer>
  <script>
    function copyInstall(el) {
      const cmd = document.getElementById('install-cmd').textContent;
      navigator.clipboard.writeText(cmd).then(() => {
        const hint = el.querySelector('.copy-hint');
        hint.textContent = '✓ Copied to clipboard';
        hint.style.color = '#3fb950';
        setTimeout(() => { hint.textContent = 'Click to copy'; hint.style.color = ''; }, 2000);
      });
    }
  </script>
</body>
</html>
```

Fill in: REPO_NAME, VALUE_PROP_FROM_AGENT_A (both places), 5-WORD-VALUE-PROP.
No placeholder text left in file.

**2. Commit and push:**
```bash
git -C <dir> add docs/
git -C <dir> commit -m "Add GitHub Pages site"
git -C <dir> push
```

**3. Enable Pages:**
```bash
gh api repos/Rishiidev/REPO_NAME/pages \
  --method POST \
  --field source='{"branch":"main","path":"/docs"}'
```

If Pages already enabled, skip without error.

**4. Set repo homepage:**
```bash
gh repo edit Rishiidev/REPO_NAME --homepage "https://Rishiidev.github.io/REPO_NAME"
```

**5. Tell user:**
"GitHub Pages will be live at https://Rishiidev.github.io/REPO_NAME in ~2 minutes."

---

## STEP: Validate Everything

Run all checks. Fix failures before reporting success.

```bash
gh repo view Rishiidev/REPO_NAME \
  --json name,description,topics,homepageUrl,hasDiscussionsEnabled,hasIssuesEnabled

gh repo view Rishiidev/REPO_NAME --json topics | jq '.topics | length'

gh release view v1.0.0 --repo Rishiidev/REPO_NAME --json assets,tagName,name

gh issue list --repo Rishiidev/REPO_NAME --label "good first issue" --json number,title

gh label list --repo Rishiidev/REPO_NAME

gh workflow list --repo Rishiidev/REPO_NAME
```

Required passing state:
- topics count ≥ 15 (not 0)
- description matches REPO_DESC
- release v1.0.0 exists
- issue #1 has "good first issue" label
- validate.yml workflow exists

---

## ═══════════════════════════════════════════════
## ═══ PARALLEL PHASE 3 ═══
## Distribution: spawn all 4 content agents in ONE response.
## ═══════════════════════════════════════════════

---

### Agent I — Reddit Post (r/ClaudeAI)

```
Write a Reddit post for r/ClaudeAI announcing: Rishiidev/REPO_NAME
Value prop: VALUE_PROP_FROM_AGENT_A
Before state: BEFORE_STATE_FROM_AGENT_A
After state: AFTER_STATE_FROM_AGENT_A
Install: /plugin install github:Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME

TITLE: (≤120 chars, specific, no clickbait, mention the skill name)
BODY: (400–600 words)
- Opening: mirror the before_state, make it feel familiar
- What it does: one paragraph, conversational, not marketing
- Before block (code or text showing the old way)
- After block (showing the new result)
- Install command
- "Feedback welcome, especially edge cases" ending

Tone: developer sharing something they built. No superlatives. Concrete.
Return the full post, ready to paste.
```

---

### Agent J — X/Twitter Thread

```
Write a 4-tweet thread for X/Twitter about: Rishiidev/REPO_NAME
Value prop: VALUE_PROP_FROM_AGENT_A
GitHub: https://github.com/Rishiidev/REPO_NAME

Tweet 1 (hook): [problem statement] + number + "how ↓"
Tweet 2 (before/after): concrete, specific, shows the gap
Tweet 3 (how): parallel agents concept, specific command or output
Tweet 4 (links): GitHub + install + ask for RT if it saves them X

Each tweet ≤280 chars. Number them 1/4, 2/4, etc.
Return ready-to-paste thread.
```

---

### Agent K — Hacker News Show HN

```
Write a Show HN submission for: Rishiidev/REPO_NAME
Value prop: VALUE_PROP_FROM_AGENT_A
GitHub: https://github.com/Rishiidev/REPO_NAME

TITLE: Show HN: REPO_NAME – [value prop with number, ≤80 chars]
BODY: (~200 words, 3 paragraphs)
  P1: Problem and why I built it
  P2: How parallel agents work technically (brief, honest)
  P3: Link, install command, what feedback I'm looking for

Audience: technical, skeptical of marketing. Direct. Humble.
No superlatives ("revolutionary", "game-changing"). Let the use case speak.
Return ready-to-post submission.
```

---

### Agent L — Awesome-List PR Draft

```
Find the best awesome-list target for: REPO_NAME
Run:
gh search repos "awesome-claude" --sort stars --limit 5 --json fullName,stargazersCount,description
gh search repos "awesome-llm" --sort stars --limit 5 --json fullName,stargazersCount,description
gh search repos "awesome-claude-code" --sort stars --limit 3 --json fullName,stargazersCount,description

Pick the best target (highest stars + most relevant to a Claude Code skill).
Fetch its README first 50 lines to match the description style:
gh api repos/<owner>/<repo>/readme --jq '.content' | base64 -d | head -50

Write:
1. The exact markdown line to add: - [REPO_NAME](url) — description matching list style
2. PR title: "Add REPO_NAME"
3. PR body (3 sentences: what it does, category it fits, why it belongs)

Return: target repo, the markdown line, and the full PR draft.
```

---

## STEP: 7-Day Launch Calendar

After all 4 distribution agents complete, generate this calendar using the content
from Agents I–L. Convert all days to absolute dates from today (2026-06-18).

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📅  7-DAY LAUNCH CALENDAR — REPO_NAME
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Day 0 — Today, 2026-06-18
  □ Pin repo on your GitHub profile (github.com → Customize profile)
  □ Add repo URL to your GitHub bio
  □ Star your own repo (seeds the star history chart)

Day 1 — 2026-06-19 (Post 9–11am ET for best r/ClaudeAI visibility)
  □ Post to r/ClaudeAI [Reddit post from Agent I below ↓]
  □ Reply to every comment within 2 hours

Day 2 — 2026-06-20 (Post 8–10am or 5–6pm ET)
  □ Post X/Twitter thread [thread from Agent J below ↓]
  □ @AnthropicAI mention if on-topic

Day 3 — 2026-06-21
  □ Open awesome-list PR [Agent L target + PR from below ↓]
  □ Post in any Claude/dev Discord you're in

Day 5 — 2026-06-23
  □ IF ≥10 stars: post Show HN [Agent K post below ↓]
     HN converts better with social proof — wait for stars
  □ Cross-post to r/artificial with different angle

Day 7 — 2026-06-25
  □ Search "claude github launch" on GitHub — are you ranking?
  □ If <5 stars: try the next-best description candidate
  □ If ≥20 stars: email 2–3 AI newsletter authors with your Show HN as context

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

REDDIT POST (Day 1 — paste to r/ClaudeAI):
[Insert Agent I output here]

TWITTER THREAD (Day 2):
[Insert Agent J output here]

SHOW HN (Day 5, after 10 stars):
[Insert Agent K output here]

AWESOME-LIST PR (Day 3):
Target: [Agent L target repo]
Markdown line: [Agent L line]
PR body: [Agent L PR body]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## STEP: Final Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ Repo:        https://github.com/Rishiidev/REPO_NAME
✓ Website:     https://Rishiidev.github.io/REPO_NAME
✓ Install:     /plugin install github:Rishiidev/REPO_NAME
✓ Name score:  X/20 — [reason it was chosen]
✓ Description: REPO_DESC
✓ Topics:      N/20 set
✓ README:      SVG embedded ✓  Competitor patterns applied ✓
✓ CI badge:    validate.yml active
✓ Discussions: [status]
✓ Labels:      5 created (incl. parallel-agent)
✓ Issue #1:    [title]
✓ Release:     v1.0.0 [with/without .skill]
✓ Pages:       live ~2min → Rishiidev.github.io/REPO_NAME
✓ Validation:  all checks passed

AGENTS SPAWNED: 12 (A–L)
PARALLEL PHASES: 3 (Phase 1: research/gen, Phase 2: config, Phase 3: distribution)
ESTIMATED TIME: ~4–6 minutes

LAUNCH ORDER (7-day calendar above):
Reddit (Day 1) → X/Twitter (Day 2) → Awesome-list PR (Day 3) → HN (Day 5, after 10★)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## WHAT NOT TO DO

- **Never run Phase 1 agents sequentially** — they lose all time benefit
- **Never skip name scoring** — even if user has a name, scoring may surface a better one
- **Never skip Agent B's competitor research** — it directly shapes README quality
- **Never omit the SVG `<img>` from README** — it must be the first element in the header div
- **Never set `--homepage` to the repo URL itself** — only to Pages URL or a real external site
- **Never overwrite an existing SKILL.md** — check first
- **Never stage `.env` or secret files** — stop and warn
- **Never create the issue before creating the labels** — it fails
- **Never use a generic good-first-issue** — tailor to the actual project category
- **Never leave placeholder text in SVG or docs/index.html** — fill every field
- **Never use relative dates in the 7-day calendar** — convert to absolute dates from 2026-06-18
- **Never skip validation** — report success only after all checks pass
