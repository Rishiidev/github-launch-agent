---
name: github-launch-agent
description: >
  Agentic GitHub launch pipeline. 16 parallel agents, 3 phases, ~4 minutes. SEO
  name scoring, competitor README research, social preview SVG, GitHub Pages,
  Product Hunt draft, LinkedIn post, newsletter pitches, DEV.to article, 7-day
  distribution calendar. Works for Claude Code skills, plugins, Node/Python/Go/
  Rust/any repo.

  Triggers: "agentic github launch", "parallel github launch", "launch agent",
  "github launch agent", "push to github fast", "agentic launch",
  "parallel launch", "launch with agents".

  Lite mode (skip Phase 3): "fast push", "quick push", "push now", "lite launch".

  Base triggers: "push to github", "github launch", "publish skill",
  "github everything", "full github setup", "github seo".

  Improve mode (existing repos): "improve my repo", "upgrade github repo",
  "audit my github repo", "fix my readme", "enhance my repo",
  "github health check", "what's missing from my repo".

onInstall: >
  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ⚡  github-launch-agent installed — v2.0.0

  16 parallel agents. 3 modes. ~4 minutes for a full launch.

  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  🚀  LAUNCH MODE  — fresh repo from scratch
      Say: "agentic github launch"
      What happens: SEO name scoring → competitor research →
      social preview SVG → GitHub Pages → Product Hunt draft →
      LinkedIn post → newsletter pitches → 7-day calendar.
      Time: ~4 min.

  ⚡  LITE MODE  — same pipeline, skip distribution
      Say: "fast push" or "quick push"
      What happens: everything in Launch except Phase 3 posts.
      Time: ~2 min.

  🔧  IMPROVE MODE  — upgrade a repo that already exists
      Say: "improve my repo" or "github health check"
      What happens: 6 parallel audit agents score your repo on
      18 dimensions, rank every gap by ROI, then fix only what
      you confirm. Never overwrites without showing a diff first.

  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  I'll only ask 3 questions. Everything else is auto-detected.
  Type "github launch help" anytime to see this again.

  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
---

# GitHub Launch Agent — Parallel Pipeline

**4 min. 16 agents. 3 parallel phases. Nothing skipped.**

---

## PIPELINE AT A GLANCE

```
STEP -1   SEO name scoring         5 candidates ranked; user picks
STEP  0   Minimal inputs           3 questions (everything else auto-detected)
STEP  1   Pre-flight safety        auth · secrets · git state · .skill path
─────────────────────────────────────────────────────────────
PARALLEL PHASE 1  (4 agents simultaneous)
  A  Project intelligence          value prop, before/after, measurable benefit
  B  Competitor research           topics, README patterns, description candidates
     [LITE: skip B — use placeholder topics, no competitor data]
  C  Social preview SVG            generic template filled from Agent A output
  D  Supporting files              CHANGELOG, .gitignore, CONTRIBUTING, LICENSE,
                                   FUNDING.yml, SECURITY.md, PR template
─────────────────────────────────────────────────────────────
PHASE 1 SYNTHESIS  (sequential, steps 1–10)
  1  Refine SVG tagline            if Agent A has a stronger value prop
  2  Choose description            pick top-scored from Agent B candidates
  3  Choose 20 topics              Agent B recommended_20
  4  Write .claude-plugin/plugin.json
  5  Write .claude-plugin/marketplace.json
  6  Write .github/workflows/validate.yml
  7  Write .github/ISSUE_TEMPLATE/feature-request.yml
  8  Write .github/ISSUE_TEMPLATE/bug-report.yml
  9  Write README.md               SVG embedded as first element
  10 Write .github/workflows/package-skill.yml
─────────────────────────────────────────────────────────────
GIT OPS   init → create repo → push
─────────────────────────────────────────────────────────────
PARALLEL PHASE 2  (4 agents simultaneous)
  E  Topics + description          20 SEO topics set
  F  Discussions + issues          enabled
  G  Labels + good-first-issue     5 labels, tailored issue
  H  GitHub release                v1.0.0 + .skill attachment
─────────────────────────────────────────────────────────────
GitHub Pages   write docs/index.html → commit → enable → verify → set homepage
Discussions    post welcome thread (skip silently if GraphQL fails)
Validation     7-check pass/fail with auto-fix
Demo storyboard   .github/record-demo.sh
─────────────────────────────────────────────────────────────
PARALLEL PHASE 3  (8 agents simultaneous)  [LITE: skip entirely]
  I  Reddit post (r/ClaudeAI)
  J  X/Twitter thread (4 tweets)
  K  Hacker News Show HN
  L  Awesome-list PR draft
  M  LinkedIn post
  N  Product Hunt copy
  O  Newsletter pitches (TLDR AI, The Rundown AI, Ben's Bites)
  P  DEV.to article draft
─────────────────────────────────────────────────────────────
7-Day Launch Calendar   absolute dates from TODAY
Final Report
```

---

## VARIABLE REGISTRY

Track all named variables throughout the pipeline. Reference these names consistently.

| Variable | Set at | Description |
|----------|--------|-------------|
| `REPO_NAME` | Step -1 | Chosen repo name |
| `REPO_DESC` | Phase 1 Synthesis step 2 | Top-scored description ≤100 chars |
| `TOPICS_LIST` | Phase 1 Synthesis step 3 | 20 SEO topics |
| `STACK` | Step 1 pre-flight (auto-detected) | e.g. "claude-skill", "node-lib" |
| `SKILL_PATH` | Step 0 Q2 (or "none") | Absolute path to .skill file |
| `PAGES_ENABLED` | Step 0 Q3 | true/false |
| `VALUE_PROP` | Agent A | One sentence with a number |
| `BEFORE_STATE` | Agent A | 2–3 sentences, concrete |
| `AFTER_STATE` | Agent A | 2–3 sentences, concrete |
| `CATEGORY` | Agent A | claude-skill, node-lib, python-tool, etc. |
| `MAIN_TRIGGER` | Agent A | Primary activation phrase |
| `INSTALL_CMD` | Agent A | Full install command |
| `TODAY` | Runtime | Current date in YYYY-MM-DD format |
| `CUSTOM_DOMAIN` | Step 0 Q3 (optional) | e.g. tools.yourdomain.com or "" |

---

## ROUTING

Read the user's trigger phrase first. Route to the correct mode before doing anything else.

| Trigger type | Mode | Entry point |
|---|---|---|
| "agentic github launch", "launch agent", "push to github", etc. | **LAUNCH MODE** | → STEP -1 (name scoring) |
| "fast push", "quick push", "lite launch" | **LITE LAUNCH** | → STEP -1, skip Agent B + Phase 3 |
| "improve my repo", "upgrade", "audit", "fix my readme", "what's missing", etc. | **IMPROVE MODE** | → IMPROVE STEP 1 |
| "github launch help", "what can you do", "show me github launch", "how does this work" | **HELP MODE** | → HELP CARD |

If the trigger is ambiguous, ask: "Are you launching a new repo or improving an existing one?"

---

## HELP MODE — Intro Card

When routed to HELP MODE, output this card verbatim (fill nothing, no questions):

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚡  github-launch-agent — v2.0.0
    16 parallel agents · 3 modes · ~4 min for a full launch
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🚀  LAUNCH MODE — fresh repo, full pipeline
    Trigger: "agentic github launch"  ·  Time: ~4 min
    ✓ SEO name scoring (5 candidates ranked)
    ✓ Competitor README research (top 3 repos mined)
    ✓ Social preview SVG auto-embedded in README
    ✓ GitHub Pages landing site
    ✓ Product Hunt draft · LinkedIn post · Newsletter pitches
    ✓ 7-day timed distribution calendar

⚡  LITE MODE — push fast, skip distribution
    Trigger: "fast push" or "quick push"  ·  Time: ~2 min
    ✓ Everything in Launch except Phase 3 distribution posts
    ✓ Good for internal tools or private-first launches

🔧  IMPROVE MODE — audit and upgrade an existing repo
    Trigger: "improve my repo" or "github health check"
    ✓ 6 parallel audit agents score 18 README dimensions
    ✓ Every gap ranked by ROI — Quick Wins flagged first
    ✓ Health Score: current/100 → projected/100
    ✓ Never overwrites without showing a diff + getting confirmation
    ✓ Fixes: topics, description, README, CHANGELOG, version
      consistency, repo settings, branch protection, Dependabot

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
I'll only ask 3 questions — everything else is auto-detected.

Ready? Just say one of the trigger phrases above.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## HOW PARALLEL PHASES WORK

When you reach an `═══ PARALLEL PHASE N ═══` section, call the Agent tool for ALL
listed agents in a **single response**. Do not call them one at a time. Independent
agents run simultaneously — this cuts wall-clock time from 20 minutes to 4.

After every parallel phase, synthesize all outputs before proceeding.

**If an agent fails or returns malformed output:**
- Agent A fails → STOP. Cannot proceed without intelligence. Re-run Agent A alone.
- Agent B fails → Use empty competitor_patterns + generate 5 generic description candidates inline. Continue.
- Agent C fails → Continue without SVG. Create placeholder image reference in README. Note in final report.
- Agent D fails → Continue. Write failed files manually in Synthesis. Note in final report.
- Any Phase 2 agent fails → Retry that agent once. If it fails again, skip and note in final report.
- Any Phase 3 agent fails → Skip and note in final report. Distribution is additive, not blocking.

---

## STEP -1 — SEO Name Optimization

Do this BEFORE asking anything else. If project files exist, read them. If none exist,
derive from the user's trigger phrase description.

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

Present as a table with the user's default name at the top row (if provided):

```
Name                      | Sat | KW | Mem | Sig | Total | Verdict
--------------------------|-----|----|-----|-----|-------|--------
(user's default)          |  X  |  X |  X  |  X  |  X    | Your default
github-launch-agent       |  4  |  5 |  4  |  5  |  18   | ★ Recommended
...
```

Tell the user: "Your default scores X/20. I recommend Y (scored Z/20) because [reason]."
Let them pick any name or type their own. **Store the chosen name as REPO_NAME.**

---

## STEP 0 — Minimal Inputs (3 Questions, One Message)

Auto-detect what you can. Ask only what you cannot.

**Auto-detect before asking:**
- Stack/language → read files in project dir (package.json → node-lib, requirements.txt/pyproject.toml → python-tool, go.mod → go-tool, Cargo.toml → rust-tool, SKILL.md → claude-skill, Dockerfile → docker-app). Default: "cli-tool".
- License → default MIT
- Discussions → default yes
- Co-author line → default keep
- Custom domain → default none

**Ask these 3 only:**

```
1. Public or private? (Default: public)
2. Path to .skill file to attach to the release? (Default: none — leave blank to skip)
3. GitHub Pages landing page? (Default: yes)
   Your repo gets a free site at Rishiidev.github.io/REPO_NAME
   → If yes: custom domain? (e.g. tools.yourdomain.com — leave blank for default)
```

Store: REPO_NAME (from Step -1), SKILL_PATH, PAGES_ENABLED, CUSTOM_DOMAIN, STACK, TODAY.

**Derive TODAY** from the system date available in context (e.g. 2026-06-18). Use it for
all absolute dates in the 7-day calendar and changelog entries.

---

## STEP 1 — Pre-flight Safety Checks

Run ALL of these before creating any files:

```bash
# 1. GitHub auth
gh auth status

# 2. Repo already exists?
gh repo view Rishiidev/REPO_NAME --json name 2>&1

# 3. Sensitive files — STOP if any found
find <project-dir> \( -name ".env" -o -name "*.pem" -o -name "*.key" -o -name "secrets*" -o -name ".env.*" \) 2>/dev/null

# 4. Git state
git -C <project-dir> rev-parse --git-dir 2>/dev/null && git -C <project-dir> log --oneline -3 2>/dev/null

# 5. Default branch
git -C <project-dir> config init.defaultBranch 2>/dev/null || echo "main"

# 6. Validate .skill file path (if SKILL_PATH is not "none")
[ -n "$SKILL_PATH" ] && [ "$SKILL_PATH" != "none" ] && test -f "$SKILL_PATH" && echo "✓ .skill found" || echo "✗ .skill not found at $SKILL_PATH — set SKILL_PATH=none"

# 7. Check SKILL.md — do NOT overwrite if it exists
find <project-dir> -name "SKILL.md" 2>/dev/null
```

Decision logic:
- Auth fails → STOP. Tell user: `gh auth login` first.
- Repo exists → skip `gh repo create`. Use `git remote add` + push.
- **Secrets found → STOP. List every file. Do not stage anything.**
- No git init → `git init -b main`
- Branch is `master` → warn, suggest: `git branch -m master main`
- .skill file not found → set SKILL_PATH=none, warn user. Continue.
- SKILL.md exists at destination path → note it, **never overwrite**.

---

## SYSTEM: Rate-Limit Guard

Define this shell function ONCE at the start of every shell session before running
any `gh api` command. Reference it as `gh_safe` wherever `gh api` is used for
mutations (PATCH, POST, PUT, GraphQL). Read-only `gh api GET` calls can use `gh api`
directly since they hit a higher rate limit tier.

```bash
# Paste this into the terminal before starting the pipeline
gh_safe() {
  local out rc
  out=$(gh api "$@" 2>&1)
  rc=$?
  if [ $rc -ne 0 ] && printf '%s' "$out" | grep -qiE "rate.?limit|secondary rate|429|abuse detection"; then
    echo "⚠  Rate limited — sleeping 60 s then retrying once..."
    sleep 60
    gh api "$@"
  else
    printf '%s\n' "$out"
    return $rc
  fi
}
```

Agent prompts use the token `[gh_safe]` to mark calls that should use this wrapper
instead of plain `gh api`. When pasting commands into a terminal, substitute
`gh_safe` for `gh api` on those lines.

---

## SYSTEM: Resume / Checkpoint

The pipeline writes a checkpoint file at `<project-dir>/.launch-state` after each
major milestone. On **every run**, check this file first at Step 1 before spawning
any agents:

```bash
STATE=<project-dir>/.launch-state
[ -f "$STATE" ] && echo "=== Existing launch state ===" && cat "$STATE"
```

If the state file shows a completed milestone, **skip everything up to and including
that milestone** and resume from the next step. Tell the user exactly what's being
skipped and why.

| Entry in .launch-state | Skip to |
|------------------------|---------|
| `phase1_done` | Git ops (Phase 1 + Synthesis already complete) |
| `git_done` | Parallel Phase 2 |
| `phase2_done` | GitHub Pages step |
| `pages_done` | Discussions + Validation |
| `phase3_done` | 7-Day Calendar (Phase 3 content already generated) |

To start fresh and ignore the state, delete the file: `rm <project-dir>/.launch-state`

Checkpoint writes are shown inline at each phase boundary below.

---

## ═══════════════════════════════════════════════
## ═══ PARALLEL PHASE 1 ═══
## Spawn all 4 agents in a SINGLE response now.
## ═══════════════════════════════════════════════

Call the Agent tool FOUR TIMES simultaneously (or THREE in LITE mode — skip B).
Do not run them sequentially. Wait for all before proceeding to synthesis.

---

### Agent A — Project Intelligence

```
You are extracting launch intelligence from a project.

Working directory: <project-dir>
Repo name: REPO_NAME
Stack: STACK (auto-detected)

Read ALL files in the directory. Then return this JSON:

{
  "value_prop": "One sentence with a number — e.g. 'Cuts GitHub launch from 20 min to 4'",
  "target_user": "Specific user type — e.g. 'developers publishing Claude Code skills'",
  "main_trigger": "Primary activation phrase",
  "install_cmd": "/plugin install github:Rishiidev/REPO_NAME",
  "platforms": ["Claude Code", "Cowork", "Claude.ai"],
  "stack": "Confirmed from files",
  "before_state": "2-3 sentences: user workflow WITHOUT this. Concrete, specific.",
  "after_state": "2-3 sentences: user workflow WITH this. Concrete, specific.",
  "measurable_benefit": "The biggest number you can derive — time saved, steps cut, etc.",
  "category": "claude-skill | node-lib | python-tool | go-tool | rust-tool | cli-tool | web-app | docker-app",
  "features": ["Feature 1 (5 words max)", "Feature 2", "Feature 3", "Feature 4"],
  "tagline": "6-8 word punchy phrase summarizing the core benefit"
}

Rules:
- value_prop MUST include a number. Estimate if needed.
- before_state and after_state must be specific to THIS project. No generic sentences.
- features must be the 4 most important things this project actually does.
- If no project files exist, derive everything from REPO_NAME and the user's description.
- Do not return placeholder text — derive every field from real project content.
```

---

### Agent B — Competitor Research + Topic Discovery

```
Research GitHub for launch preparation.
Project: REPO_NAME
Description: <brief description from context>
Stack: STACK

Run these search commands:

gh search repos --topic claude --sort stars --limit 15 --json name,topics,description,stargazersCount
gh search repos "github launch" --sort stars --limit 10 --json name,topics,description,stargazersCount
gh search repos "claude skill" --sort stars --limit 10 --json name,topics,description,stargazersCount

Count topic frequency across all results. Extract top 25 topics.

Identify the 3 most similar repos by relevance + star count. For each:
gh api repos/<owner>/<repo>/readme --jq '.content' 2>/dev/null | base64 -d | head -120

From those 3 READMEs, extract:
- headline_has_number: does the title contain a number?
- install_position: within first 30 lines / middle / late
- cta_position: early (before feature table) / middle / late / absent
- value_prop_style: outcome-first / feature-first / problem-first

Generate 5 scored repo description candidates for REPO_NAME (≤100 chars each):
Score: has_number (2pts), action_verb_first (2pts), benefit_clear (2pts),
       under_80_chars (2pts), no_jargon (2pts). Max 10.

Return JSON:
{
  "top_25_topics": ["topic1", "topic2", ...],
  "recommended_20": ["t1", "t2", ...],
  "competitor_patterns": {
    "headline_has_number": true,
    "install_position": "early",
    "cta_position": "early",
    "value_prop_style": "outcome-first"
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

YOU MUST FILL EVERY PLACEHOLDER before writing. No template text in the output file.

Values to use (all derived from project context, not from github-launch-agent):
  PROJECT_NAME   → REPO_NAME
  PROJECT_TAGLINE → Agent A tagline field (6-8 word benefit phrase for THIS project)
  INSTALL_CMD    → /plugin install github:Rishiidev/REPO_NAME
  FEATURE_1 through FEATURE_4 → Agent A features array (4 items, 5 words max each)
  USERNAME       → Rishiidev

If Agent A output is not yet available, derive tagline and features directly from
the project files you can read. Do NOT use any github-launch-agent content.

Write this SVG with all placeholders replaced:

<svg width="1280" height="640" xmlns="http://www.w3.org/2000/svg">
  <rect width="1280" height="640" fill="#0d1117"/>
  <defs>
    <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
      <path d="M 40 0 L 0 0 0 40" fill="none" stroke="#161b22" stroke-width="1"/>
    </pattern>
  </defs>
  <rect width="1280" height="640" fill="url(#grid)"/>
  <rect x="0" y="0" width="6" height="640" fill="#f0883e"/>

  <!-- Category eyebrow — derive from CATEGORY field -->
  <text x="60" y="96" font-family="system-ui, sans-serif" font-size="20"
        font-weight="600" fill="#f0883e" letter-spacing="4">CATEGORY_LABEL</text>

  <!-- Project name -->
  <text x="60" y="205" font-family="system-ui, sans-serif" font-size="72"
        font-weight="800" fill="#ffffff">PROJECT_NAME</text>

  <!-- Tagline — FROM AGENT A, specific to this project -->
  <text x="60" y="265" font-family="system-ui, sans-serif" font-size="28"
        fill="#8b949e">PROJECT_TAGLINE</text>

  <!-- 4 feature boxes — FROM AGENT A features array, specific to this project -->
  <rect x="60" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="60" y="300" width="4" height="38" rx="2" fill="#58a6ff"/>
  <text x="76" y="324" font-family="'Courier New', monospace" font-size="15"
        fill="#58a6ff">▶ FEATURE_1</text>

  <rect x="350" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="350" y="300" width="4" height="38" rx="2" fill="#3fb950"/>
  <text x="366" y="324" font-family="'Courier New', monospace" font-size="15"
        fill="#3fb950">▶ FEATURE_2</text>

  <rect x="640" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="640" y="300" width="4" height="38" rx="2" fill="#f0883e"/>
  <text x="656" y="324" font-family="'Courier New', monospace" font-size="15"
        fill="#f0883e">▶ FEATURE_3</text>

  <rect x="930" y="300" width="270" height="38" rx="6" fill="#161b22"/>
  <rect x="930" y="300" width="4" height="38" rx="2" fill="#d2a8ff"/>
  <text x="946" y="324" font-family="'Courier New', monospace" font-size="15"
        fill="#d2a8ff">▶ FEATURE_4</text>

  <!-- Install command block -->
  <rect x="60" y="393" width="1020" height="64" rx="8" fill="#161b22"/>
  <rect x="60" y="393" width="4" height="64" rx="2" fill="#f0883e"/>
  <text x="86" y="430" font-family="'Courier New', monospace" font-size="23"
        fill="#f0883e">$</text>
  <text x="114" y="430" font-family="'Courier New', monospace" font-size="23"
        fill="#e6edf3">INSTALL_CMD</text>

  <!-- Feature pills — derive 5 short benefit phrases from Agent A -->
  <rect x="60" y="488" width="160" height="34" rx="17" fill="#161b22"/>
  <text x="140" y="510" font-family="system-ui, sans-serif" font-size="14"
        fill="#8b949e" text-anchor="middle">PILL_1</text>

  <rect x="234" y="488" width="160" height="34" rx="17" fill="#161b22"/>
  <text x="314" y="510" font-family="system-ui, sans-serif" font-size="14"
        fill="#8b949e" text-anchor="middle">PILL_2</text>

  <rect x="408" y="488" width="160" height="34" rx="17" fill="#161b22"/>
  <text x="488" y="510" font-family="system-ui, sans-serif" font-size="14"
        fill="#8b949e" text-anchor="middle">PILL_3</text>

  <rect x="582" y="488" width="160" height="34" rx="17" fill="#161b22"/>
  <text x="662" y="510" font-family="system-ui, sans-serif" font-size="14"
        fill="#8b949e" text-anchor="middle">PILL_4</text>

  <rect x="756" y="488" width="160" height="34" rx="17" fill="#161b22"/>
  <text x="836" y="510" font-family="system-ui, sans-serif" font-size="14"
        fill="#8b949e" text-anchor="middle">PILL_5</text>

  <text x="1220" y="610" font-family="system-ui, sans-serif" font-size="19"
        fill="#484f58" text-anchor="end">github.com/USERNAME</text>
</svg>

CATEGORY_LABEL mapping (derive from CATEGORY):
  claude-skill → "CLAUDE CODE SKILL"
  node-lib     → "NODE.JS LIBRARY"
  python-tool  → "PYTHON TOOL"
  go-tool      → "GO CLI TOOL"
  rust-tool    → "RUST TOOL"
  cli-tool     → "COMMAND LINE TOOL"
  web-app      → "WEB APPLICATION"
  docker-app   → "DOCKER APPLICATION"

PILL_1 through PILL_5: derive 5 short (1-2 words) benefit phrases from Agent A's
value_prop and features. Examples: "open source", "MIT license", "zero config",
"one command", "self-hosted". Make them specific to the project, not generic.

After writing, confirm the file path. Do not write any placeholder text to disk.
```

---

### Agent D — Supporting Files

```
Write these 7 files for project REPO_NAME.
GitHub username: Rishiidev
License: MIT
Stack: STACK
Category: CATEGORY (from Agent A, or derive from STACK)
Date: TODAY
Project description: VALUE_PROP (from Agent A, or derive from project files)

IMPORTANT: All templates below must be filled with project-specific content.
Do not include github-launch-agent content in any file.

--- File 1: CHANGELOG.md ---
# Changelog

All notable changes documented here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [1.0.0] — TODAY

### Added
[Write 4-6 bullet points describing what version 1.0.0 of REPO_NAME adds.
Derive from the project files and VALUE_PROP. Be specific to this project.
Do not describe github-launch-agent features unless this IS github-launch-agent.]

--- File 2: .gitignore ---
[Generate a stack-appropriate .gitignore based on STACK/CATEGORY.
Always include these regardless of stack:]
.DS_Store
*.log
*.zip
.env
.env.*
*.pem
*.key
secrets*

[Add stack-specific entries based on STACK:
  node-lib     → node_modules/ dist/ build/ *.tgz .npm/
  python-tool  → __pycache__/ *.pyc .venv/ venv/ dist/ build/ *.egg-info/
  go-tool      → vendor/ *.test
  rust-tool    → target/ Cargo.lock (if library)
  claude-skill → *.skill.bak
  docker-app   → .docker/ docker-compose.override.yml
  web-app      → node_modules/ .next/ .nuxt/ dist/]

--- File 3: CONTRIBUTING.md (≤50 lines) ---
# Contributing to REPO_NAME

[Write category-appropriate contributing guidelines.

For claude-skill:
  - How to test trigger phrases
  - How to verify agent output quality
  - PR format: what changed, before/after output

For node-lib:
  - npm install, npm test
  - TypeScript type requirements
  - Semver guidance

For python-tool:
  - pip install -e ".[dev]", pytest
  - Type hints required
  - Docstring format

For go-tool / rust-tool / cli-tool / web-app / docker-app:
  - Build and test commands specific to that stack
  - Code style requirements
  - PR checklist

All categories include:
  - How to open a good bug report
  - Good-first-issue guidance
  - One-paragraph welcome message]

--- File 4: LICENSE ---
MIT License

Copyright (c) TODAY_YEAR Rishiidev

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

--- File 5: .github/FUNDING.yml ---
github: [Rishiidev]

--- File 6: SECURITY.md ---
# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 1.x     | ✓ |

## Reporting a Vulnerability

Do not open a public issue for security vulnerabilities.
Open a [GitHub Issue](https://github.com/Rishiidev/REPO_NAME/issues/new)
with the prefix `[SECURITY]` — visible to maintainers only.

Include: description, steps to reproduce, potential impact.
Response within 72 hours. Resolution within 7 days for confirmed issues.

## Scope

[Write 3-5 scope items appropriate to CATEGORY.
For claude-skill: prompt injection, unintended data exposure, safety bypass.
For node-lib: dependency vulnerabilities, prototype pollution, unsafe deserialization.
For python-tool: code injection, path traversal, dependency issues.
For web-app: XSS, CSRF, injection attacks, auth bypass.
For cli-tool: command injection, path traversal, privilege escalation.]

--- File 7: .github/PULL_REQUEST_TEMPLATE.md ---
## What this changes

<!-- Which component, function, or file changed? Be specific. -->

## Why

<!-- What problem does this solve, or what output does it improve? -->

## Before / after

Before:
(paste old behavior or output)

After:
(paste improved behavior or output)

## Checklist

[Generate 4-6 checklist items appropriate to CATEGORY and REPO_NAME.
For claude-skill: trigger phrase tested, output quality verified, SKILL.md not overwritten.
For node-lib: tests pass, types updated, examples work.
For python-tool: pytest passes, type hints added, docstrings updated.
For go-tool: go test ./... passes, go vet clean.
For web-app: manual smoke test in browser, responsive on mobile.
All: No secrets committed, no placeholder text left unfilled.]

Write all 7 files to <project-dir>. Confirm each file written.
TODAY_YEAR = first 4 chars of TODAY (e.g. "2026" from "2026-06-18").
```

---

## PHASE 1 SYNTHESIS

After all agents complete (or after fallback handling for any failures), execute these
steps IN ORDER. Do not skip any. Do not reorder them.

### Step 1 — Refine SVG Tagline

Compare Agent A's `value_prop` against the tagline in the SVG.
If value_prop is more compelling and shorter, update only the tagline line in
`assets/social-preview.svg`. Do not modify any other SVG content.

### Step 2 — Choose Description

Display Agent B's 5 scored description candidates to the user as a table.
Auto-select the top-scored one as REPO_DESC.
Tell the user: "I've selected [REPO_DESC] (score N/10). Say any number 1–5 to pick
another, or type your own."

If Agent B failed → generate 3 candidates inline based on Agent A's value_prop.
Apply the same scoring criteria. Select the top.

### Step 3 — Choose 20 Topics

Use Agent B's `recommended_20`. If fewer than 20, fill from `top_25_topics`.
If Agent B failed → generate 20 topics from: stack keywords, category keywords,
"github", "open-source", "developer-tools", and 10 terms from the value_prop/features.
Store as TOPICS_LIST.

### Step 4 — Write `.claude-plugin/plugin.json`

```json
{
  "name": "REPO_NAME",
  "description": "REPO_DESC",
  "version": "1.0.0",
  "author": { "name": "Rishiidev" },
  "homepage": "https://Rishiidev.github.io/REPO_NAME",
  "repository": "https://github.com/Rishiidev/REPO_NAME",
  "license": "MIT",
  "skills": "./skills"
}
```

### Step 5 — Write `.claude-plugin/marketplace.json`

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
      "description": "<3 sentences: what it does · trigger phrases · supported platforms>",
      "source": "./"
    }
  ]
}
```

### Step 6 — Write `.github/workflows/validate.yml`

```yaml
name: Validate
on: [push, pull_request]
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Check README exists
        run: test -f README.md && echo "✓ README.md found"
      - name: Check plugin.json exists
        run: test -f .claude-plugin/plugin.json && echo "✓ plugin.json found"
      - name: Check social preview exists
        run: test -f assets/social-preview.svg && echo "✓ social preview found"
      - name: Check SKILL.md exists (claude-skill only)
        if: ${{ github.event_name == 'push' }}
        run: |
          if find skills -name "SKILL.md" 2>/dev/null | grep -q .; then
            echo "✓ SKILL.md found"
          else
            echo "ℹ No SKILL.md — skipping (not a claude-skill)"
          fi
      - name: Lint JSON files
        run: |
          for f in $(find . -name "*.json" -not -path "*/node_modules/*"); do
            python3 -c "import json,sys; json.load(open('$f'))" && echo "✓ $f valid" || exit 1
          done
```

### Step 7 — Write `.github/ISSUE_TEMPLATE/feature-request.yml`

```yaml
name: Feature Request
description: Suggest an improvement
labels: ["enhancement"]
body:
  - type: textarea
    id: problem
    attributes:
      label: What problem does this solve?
    validations:
      required: true
  - type: textarea
    id: solution
    attributes:
      label: Proposed solution
      description: Before/after showing the improvement
    validations:
      required: true
  - type: textarea
    id: test
    attributes:
      label: How to verify
    validations:
      required: true
```

### Step 8 — Write `.github/ISSUE_TEMPLATE/bug-report.yml`

```yaml
name: Bug Report
description: Something produced wrong output or failed
labels: ["bug"]
body:
  - type: textarea
    id: trigger
    attributes:
      label: How to reproduce
    validations:
      required: true
  - type: textarea
    id: expected
    attributes:
      label: Expected behavior
    validations:
      required: true
  - type: textarea
    id: actual
    attributes:
      label: Actual behavior
    validations:
      required: true
  - type: input
    id: version
    attributes:
      label: Version
      placeholder: "1.0.0"
```

### Step 9 — Write README.md

Apply `competitor_patterns` from Agent B. Use `before_state`/`after_state` from Agent A.

**MANDATORY RULE — SVG in README:**
The social preview SVG must be the FIRST element inside `<div align="center">`.
Do not skip it. Format:
```html
<img src="assets/social-preview.svg" alt="REPO_NAME — VALUE_PROP" width="100%"/>
```

**MANDATORY RULE — First 160 chars after title block:**
Must be the value_prop sentence. GitHub search shows these chars. No code blocks or
tables before this sentence.

**MANDATORY RULE — Star CTA placement:**
Place it BEFORE the feature tables. People who stop reading mid-page still see it.

**MANDATORY RULE — UTM parameters:**
All GitHub links in distribution content use `?utm_source=readme`. The star link in
the README header uses no UTM (it's organic). Distribution links use platform UTMs.

```markdown
# ⚡ REPO_NAME — [5-word value prop from Agent A]

<div align="center">
  <img src="assets/social-preview.svg" alt="REPO_NAME — VALUE_PROP" width="100%"/>
  <br/><br/>

**VALUE_PROP**

[![Stars](https://img.shields.io/github/stars/Rishiidev/REPO_NAME?style=for-the-badge&color=gold)](https://github.com/Rishiidev/REPO_NAME/stargazers)
[![CI](https://github.com/Rishiidev/REPO_NAME/actions/workflows/validate.yml/badge.svg)](https://github.com/Rishiidev/REPO_NAME/actions)
[![License](https://img.shields.io/github/license/Rishiidev/REPO_NAME?style=for-the-badge)](LICENSE)
[![Version](https://img.shields.io/badge/version-1.0.0-blue?style=for-the-badge)](https://github.com/Rishiidev/REPO_NAME/releases)

*Works in [PLATFORMS from Agent A]*

</div>

> VALUE_PROP [max 160 chars from here — this is what GitHub search shows]

---

## The Problem
[BEFORE_STATE — 3-4 lines, concrete, written like someone who's been there]

## The Fix
[AFTER_STATE — 1-3 lines + the main trigger in a code block]

---

## Install

| Platform | Command |
|----------|---------|
| **Claude Code** | `INSTALL_CMD` |
| **Cowork** | `INSTALL_CMD` |
| **Claude.ai** | Download [`.skill` file](../../releases/latest) → import |

---

<div align="center">
<b>MEASURABLE_BENEFIT. Star it — 2 seconds.</b><br>
<a href="https://github.com/Rishiidev/REPO_NAME">⭐ Star on GitHub</a>
</div>

---

## How It Works
[Pipeline or architecture description appropriate to the category.
For claude-skill: list the trigger phrases and what happens.
For node-lib: show the API with a code example.
For cli-tool: show --help output or key subcommands.
For web-app: show the key flows.]

## What It Builds / What It Does
[File tree or feature list appropriate to category]

## Trigger Phrases / API Reference
[Table of all triggers for claude-skill, or API surface for libraries]

## Star History
[![Star History Chart](https://api.star-history.com/svg?repos=Rishiidev/REPO_NAME&type=Date)](https://star-history.com/#Rishiidev/REPO_NAME&Date)

---

MIT License · [Rishiidev](https://github.com/Rishiidev)

---

<div align="center">
<b>Found REPO_NAME useful? A ⭐ helps others find it.</b><br>
<a href="https://github.com/Rishiidev/REPO_NAME">⭐ Star this repo</a>
</div>
```

### Step 10 — Write `.github/workflows/package-skill.yml`

Only write this file if CATEGORY is "claude-skill". Skip for all other categories.

```yaml
name: Package skill
on:
  release:
    types: [created]
jobs:
  package:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v4
      - name: Find SKILL.md
        id: find
        run: |
          SKILL=$(find skills -name "SKILL.md" | head -1)
          NAME=$(basename "$(dirname "$SKILL")")
          echo "skill_path=$SKILL" >> "$GITHUB_OUTPUT"
          echo "skill_name=$NAME" >> "$GITHUB_OUTPUT"
      - name: Package .skill file
        run: |
          mkdir -p /tmp/skill-pkg/skill-pkg/${{ steps.find.outputs.skill_name }}
          cp "${{ steps.find.outputs.skill_path }}" \
             /tmp/skill-pkg/skill-pkg/${{ steps.find.outputs.skill_name }}/
          cd /tmp/skill-pkg
          zip -r "${{ steps.find.outputs.skill_name }}.skill" skill-pkg/
          cp "${{ steps.find.outputs.skill_name }}.skill" "$GITHUB_WORKSPACE/"
      - name: Upload .skill to release
        uses: softprops/action-gh-release@v2
        with:
          files: ${{ steps.find.outputs.skill_name }}.skill
```

---

**After step 10 completes — write checkpoint:**
```bash
echo "phase1_done:$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> <project-dir>/.launch-state
```

---

## STEP: Git, Create Repo, Push

```bash
# Ensure git initialized
git -C <dir> rev-parse --git-dir 2>/dev/null || git -C <dir> init -b main

# Review status — if .env or secrets appear, add to .gitignore first
git -C <dir> status

# Stage everything
git -C <dir> add -A

# Commit message:
# No prior commits → "Initial release: REPO_NAME v1.0.0"
# Has prior commits → "Add GitHub launch assets: REPO_NAME v1.0.0"
# Always include co-author line (default: keep)
git -C <dir> commit -m "$(cat <<'EOF'
Initial release: REPO_NAME v1.0.0

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
EOF
)"

# Create repo and push (if new repo)
gh repo create REPO_NAME --public \
  --description "REPO_DESC" \
  --source <dir> \
  --remote origin \
  --push

# If repo already existed from pre-flight:
# git -C <dir> remote add origin https://github.com/Rishiidev/REPO_NAME.git 2>/dev/null || true
# git -C <dir> push -u origin main

# Checkpoint — write after successful push
echo "git_done:$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> <dir>/.launch-state
```

---

## ═══════════════════════════════════════════════
## ═══ PARALLEL PHASE 2 ═══
## Post-push: spawn all 4 agents in ONE response.
## ═══════════════════════════════════════════════

---

### Agent E — Topics + Description

```
Set topics and description on: Rishiidev/REPO_NAME

Apply all 20 topics from TOPICS_LIST.
Use [gh_safe] for each mutation (rate-limit guard):
gh_safe repos/Rishiidev/REPO_NAME/topics --method PUT \
  --field names[]="<topic1>" --field names[]="<topic2>" ... [all 20]

gh_safe repos/Rishiidev/REPO_NAME --method PATCH --field description="REPO_DESC"

Verify (plain gh api — read-only):
gh api repos/Rishiidev/REPO_NAME --jq '{topics:.topics, desc:.description}'

Report: "Topics set: N/20. Description: [value]"
If fewer than 20: list which failed and retry once with gh_safe.
```

---

### Agent F — Discussions + Issues

```
Enable features on: Rishiidev/REPO_NAME

Use [gh_safe] for both mutations:
gh_safe repos/Rishiidev/REPO_NAME --method PATCH --field has_discussions=true
gh_safe repos/Rishiidev/REPO_NAME --method PATCH --field has_issues=true

Verify (plain gh api — read-only):
gh api repos/Rishiidev/REPO_NAME --jq '{discussions:.hasDiscussionsEnabled, issues:.hasIssuesEnabled}'

Report result. If either fails, report the error verbatim.
```

---

### Agent G — Labels + Good First Issue

Labels MUST be created before the issue. Run G1 then G2 sequentially inside this agent.

```
Repo: Rishiidev/REPO_NAME
Category: CATEGORY

Step G1 — Create labels using [gh_safe] (errors ok, continue):
gh_safe repos/Rishiidev/REPO_NAME/labels --method POST --field name="good first issue" --field color="7057ff" --field description="Good for newcomers" 2>/dev/null || true
gh_safe repos/Rishiidev/REPO_NAME/labels --method POST --field name="documentation"   --field color="0075ca" --field description="Improvements to docs" 2>/dev/null || true
gh_safe repos/Rishiidev/REPO_NAME/labels --method POST --field name="enhancement"      --field color="a2eeef" --field description="New feature" 2>/dev/null || true
gh_safe repos/Rishiidev/REPO_NAME/labels --method POST --field name="bug"              --field color="d73a4a" --field description="Something isn't working" 2>/dev/null || true
gh_safe repos/Rishiidev/REPO_NAME/labels --method POST --field name="question"         --field color="d876e3" --field description="Further information needed" 2>/dev/null || true

Step G2 — Create tailored good first issue based on CATEGORY:

Category → Issue title and body:

claude-skill:
  Title: "Add 3 trigger phrase variations with before/after output"
  Body: Exact steps to add a trigger phrase. Verify it activates correctly.

node-lib:
  Title: "Add TypeScript types to the main export"
  Body: Which file to edit, what types are needed, how to verify.

python-tool:
  Title: "Add a concrete usage example to the README"
  Body: Where to add it, what format, how to run it.

go-tool:
  Title: "Add --verbose flag with structured output"
  Body: Which file, cobra/flag pattern to use, expected output format.

rust-tool:
  Title: "Add --quiet flag to suppress non-error output"
  Body: Which crate pattern, where to add, how to test.

cli-tool / web-app / docker-app:
  Title: "Improve README with a concrete before/after example"
  Body: Specific section to improve, format, what counts as good.

All issues end with:
"**Why this helps:** [one sentence benefit]

**Steps:**
1. Fork this repo
2. [specific steps for REPO_NAME]
3. Open a PR with before/after showing it works

No deep knowledge required — estimated time: under 1 hour."

gh issue create \
  --repo Rishiidev/REPO_NAME \
  --title "<tailored title>" \
  --body "<tailored body as above>" \
  --label "good first issue" \
  --label "documentation"

Report: "Labels: 5 created. Issue #1: [title]"
```

---

### Agent H — GitHub Release

```
Create release for: Rishiidev/REPO_NAME
.skill file: SKILL_PATH (validated as existing in Step 1, or "none")
Date: TODAY

Validate: if SKILL_PATH is not "none", verify file exists before attaching.

gh release create v1.0.0 \
  $([ "SKILL_PATH" != "none" ] && echo "SKILL_PATH") \
  --repo Rishiidev/REPO_NAME \
  --title "v1.0.0 — Initial Release" \
  --notes "## What's in v1.0.0

Released: TODAY

### Added
[Copy the bullet points from CHANGELOG.md v1.0.0 section — specific to this project]

### Install
**Claude Code / Cowork:**
\`\`\`
INSTALL_CMD
\`\`\`
**Claude.ai:** Download \`REPO_NAME.skill\` below → import.

### What's next
See [open issues](https://github.com/Rishiidev/REPO_NAME/issues) — contributions welcome."

Report: "Release v1.0.0 created. Assets: N"
If no .skill file: "Release v1.0.0 created. No .skill file attached — add SKILL_PATH next time."
```

**After all Phase 2 agents complete — write checkpoint:**
```bash
echo "phase2_done:$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> <project-dir>/.launch-state
```

---

## STEP: GitHub Pages (if PAGES_ENABLED=true)

After PARALLEL PHASE 2 completes:

**1. Write `docs/index.html`** (fill ALL placeholders before writing):

- `REPO_NAME` → chosen repo name
- `VALUE_PROP` → from Agent A, full value_prop sentence
- `HERO_HEADLINE` → short punchy version: for time savings use "[before] → [after]." (e.g. "20 min → 4."); otherwise extract the strongest 2-4 word impact phrase
- `CATEGORY_LABEL` → from CATEGORY: claude-skill → "Claude Code skill", node-lib → "Node.js library", cli-tool → "CLI tool", etc.
- `MAIN_TRIGGER` → from Agent A main_trigger
- `INSTALL_CMD` → full install command
- No placeholder text in the written file.

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="VALUE_PROP">
  <meta property="og:title" content="REPO_NAME">
  <meta property="og:description" content="VALUE_PROP">
  <meta property="og:image" content="https://raw.githubusercontent.com/Rishiidev/REPO_NAME/main/assets/social-preview.svg">
  <title>REPO_NAME</title>
  <style>
    *,*::before,*::after{margin:0;padding:0;box-sizing:border-box}
    :root{--bg:#0d1117;--bg2:#161b22;--bg3:#21262d;--border:#30363d;--subtle:#21262d;--text:#e6edf3;--muted:#8b949e;--faint:#484f58;--orange:#f0883e;--blue:#58a6ff;--green:#3fb950;--purple:#d2a8ff}
    html{scroll-behavior:smooth}
    body{background:var(--bg);color:var(--text);font-family:system-ui,-apple-system,sans-serif;line-height:1.6}
    a{color:inherit;text-decoration:none}
    nav{position:sticky;top:0;z-index:100;background:rgba(13,17,23,.88);backdrop-filter:blur(12px);-webkit-backdrop-filter:blur(12px);border-bottom:1px solid var(--subtle);height:56px;padding:0 32px;display:flex;align-items:center;justify-content:space-between}
    .nav-brand{display:flex;align-items:center;gap:9px;font-size:15px;font-weight:600}
    .nav-dot{width:8px;height:8px;border-radius:50%;background:var(--orange);flex-shrink:0}
    .nav-links{display:flex;gap:24px}
    .nav-links a{font-size:14px;color:var(--muted);transition:color .15s}
    .nav-links a:hover{color:var(--text)}
    .nav-star{background:var(--orange);color:#0d1117;padding:7px 16px;border-radius:7px;font-size:14px;font-weight:600;transition:opacity .15s}
    .nav-star:hover{opacity:.88}
    .hero{max-width:900px;margin:0 auto;padding:80px 32px 56px}
    .hero-eyebrow{font-size:12px;color:var(--orange);text-transform:uppercase;letter-spacing:2px;margin-bottom:20px}
    .hero-headline{font-size:clamp(48px,9vw,88px);font-weight:800;line-height:.95;letter-spacing:-2px;margin-bottom:24px}
    .hero-headline .arrow{color:var(--orange)}
    .hero-sub{font-size:18px;color:var(--muted);max-width:480px;margin-bottom:40px;line-height:1.65}
    .terminal{background:var(--bg2);border:1px solid var(--border);border-radius:10px;overflow:hidden;max-width:560px}
    .t-bar{background:var(--bg3);padding:10px 14px;display:flex;align-items:center;gap:7px;border-bottom:1px solid var(--subtle)}
    .dot{width:11px;height:11px;border-radius:50%}
    .dot-r{background:#e05252}.dot-y{background:#e0a952}.dot-g{background:#52c452}
    .t-title{font-size:12px;color:var(--faint);margin:0 auto;font-family:'Courier New',monospace}
    .t-body{padding:18px 20px}
    .t-line{font-family:'Courier New',monospace;font-size:clamp(13px,2.5vw,16px)}
    .t-prompt{color:var(--faint)}.t-cmd{color:var(--orange)}.t-out{color:var(--green);margin-top:6px;font-size:13px}
    .t-actions{display:flex;align-items:center;gap:10px;margin-top:14px}
    .t-copy{background:var(--bg3);border:1px solid var(--border);color:var(--muted);border-radius:6px;padding:0 14px;height:40px;min-width:44px;font-size:13px;cursor:pointer;display:flex;align-items:center;gap:6px;transition:border-color .15s,color .15s;font-family:system-ui,sans-serif}
    .t-copy:hover{border-color:var(--muted);color:var(--text)}
    .t-hint{font-size:12px;color:var(--faint)}
    .section{max-width:900px;margin:0 auto;padding:0 32px 64px}
    .section-head{margin-bottom:28px}
    .section-head h2{font-size:24px;font-weight:700;margin-bottom:6px}
    .section-head p{font-size:15px;color:var(--muted)}
    .output-grid{display:grid;grid-template-columns:1fr 1fr;gap:16px}
    .output-card{background:var(--bg2);border:1px solid var(--subtle);border-radius:10px;padding:22px}
    .output-title{font-size:15px;font-weight:600;margin-bottom:16px;display:flex;align-items:center;gap:8px}
    .output-dot{width:7px;height:7px;border-radius:50%}
    .checklist{display:flex;flex-direction:column;gap:9px}
    .check-item{font-size:13px;color:var(--muted);display:flex;gap:8px;line-height:1.45}
    .check-icon{color:var(--green);flex-shrink:0}
    footer{border-top:1px solid var(--subtle)}
    .footer-inner{max-width:900px;margin:0 auto;padding:32px;display:flex;align-items:center;justify-content:space-between}
    .footer-left{font-size:13px;color:var(--faint)}
    .footer-left a{color:var(--muted);transition:color .15s}
    .footer-left a:hover{color:var(--text)}
    .footer-star{background:var(--bg2);border:1px solid var(--border);color:var(--muted);padding:8px 18px;border-radius:7px;font-size:13px;transition:border-color .15s,color .15s}
    .footer-star:hover{border-color:var(--muted);color:var(--text)}
    .sticky-cta{display:none;position:fixed;bottom:0;left:0;right:0;background:var(--bg2);border-top:1px solid var(--border);padding:14px 20px;align-items:center;justify-content:space-between;z-index:50}
    .sticky-cta-text{font-size:14px;color:var(--muted)}
    .sticky-cta-btn{background:var(--orange);color:#0d1117;padding:10px 20px;border-radius:7px;font-size:14px;font-weight:600;white-space:nowrap}
    @media(max-width:720px){nav{padding:0 20px}.nav-links{display:none}.hero{padding:48px 20px 40px}.section{padding-left:20px;padding-right:20px}.output-grid{grid-template-columns:1fr}.footer-inner{padding:24px 20px;flex-direction:column;gap:16px;text-align:center}.sticky-cta{display:flex}body{padding-bottom:72px}}
  </style>
</head>
<body>
<nav>
  <div class="nav-brand"><div class="nav-dot"></div>REPO_NAME</div>
  <div class="nav-links">
    <a href="#install">install</a>
    <a href="#what-you-get">what you get</a>
    <a href="https://github.com/Rishiidev/REPO_NAME#readme">docs</a>
    <a href="https://github.com/Rishiidev/REPO_NAME">GitHub</a>
  </div>
  <a href="https://github.com/Rishiidev/REPO_NAME" class="nav-star">⭐ Star</a>
</nav>
<section class="hero" id="install">
  <div class="hero-eyebrow">CATEGORY_LABEL</div>
  <div class="hero-headline">HERO_HEADLINE</div>
  <p class="hero-sub">VALUE_PROP</p>
  <div class="terminal">
    <div class="t-bar">
      <div class="dot dot-r"></div><div class="dot dot-y"></div><div class="dot dot-g"></div>
      <div class="t-title">claude — bash</div>
    </div>
    <div class="t-body">
      <div class="t-line"><span class="t-prompt">$ </span><span class="t-cmd">INSTALL_CMD</span></div>
      <div class="t-line t-out">✓ Installed. Type "MAIN_TRIGGER" to start.</div>
      <div class="t-actions">
        <button class="t-copy" id="copy-btn" onclick="copyInstall()">
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/></svg>
          Copy
        </button>
        <span class="t-hint">Works in Claude Code · Cowork · Claude.ai</span>
      </div>
    </div>
  </div>
</section>
<section class="section" id="what-you-get">
  <div class="section-head"><h2>What you get</h2><p>VALUE_PROP</p></div>
  <div class="output-grid">
    <div class="output-card">
      <div class="output-title"><div class="output-dot" style="background:var(--orange)"></div>Files created</div>
      <div class="checklist">
        <div class="check-item"><span class="check-icon">✓</span>README with competitor-benchmarked structure</div>
        <div class="check-item"><span class="check-icon">✓</span>Social preview SVG embedded as hero image</div>
        <div class="check-item"><span class="check-icon">✓</span>GitHub Pages site with click-to-copy install</div>
        <div class="check-item"><span class="check-icon">✓</span>20 SEO topics + tailored good-first-issue</div>
        <div class="check-item"><span class="check-icon">✓</span>Release v1.0.0 with .skill file attached</div>
        <div class="check-item"><span class="check-icon">✓</span>SECURITY.md · FUNDING.yml · CI workflow · PR template</div>
      </div>
    </div>
    <div class="output-card">
      <div class="output-title"><div class="output-dot" style="background:var(--blue)"></div>Distribution ready</div>
      <div class="checklist">
        <div class="check-item"><span class="check-icon">✓</span>LinkedIn post — Day 0</div>
        <div class="check-item"><span class="check-icon">✓</span>Reddit post (r/ClaudeAI) — Day 1</div>
        <div class="check-item"><span class="check-icon">✓</span>X/Twitter thread — Day 2</div>
        <div class="check-item"><span class="check-icon">✓</span>DEV.to article — Day 3</div>
        <div class="check-item"><span class="check-icon">✓</span>Product Hunt copy — Day 4 (after 5★)</div>
        <div class="check-item"><span class="check-icon">✓</span>Show HN + awesome-list PR — Day 5 (after 10★)</div>
      </div>
    </div>
  </div>
</section>
<footer>
  <div class="footer-inner">
    <div class="footer-left">MIT License · <a href="https://github.com/Rishiidev/REPO_NAME">GitHub</a> · Built by <a href="https://github.com/Rishiidev">Rishiidev</a></div>
    <a href="https://github.com/Rishiidev/REPO_NAME" class="footer-star">⭐ Star on GitHub</a>
  </div>
</footer>
<div class="sticky-cta" id="sticky-cta">
  <div class="sticky-cta-text">Star — takes 2 seconds</div>
  <a href="https://github.com/Rishiidev/REPO_NAME" class="sticky-cta-btn">⭐ Star</a>
</div>
<script>
  function copyInstall(){const cmd='INSTALL_CMD';const btn=document.getElementById('copy-btn');navigator.clipboard.writeText(cmd).then(()=>{btn.innerHTML='<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" aria-hidden="true"><polyline points="20 6 9 17 4 12"/></svg> Copied';btn.style.color='#3fb950';btn.style.borderColor='#3fb950';setTimeout(()=>{btn.innerHTML='<svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" aria-hidden="true"><rect x="9" y="9" width="13" height="13" rx="2"/><path d="M5 15H4a2 2 0 0 1-2-2V4a2 2 0 0 1 2-2h9a2 2 0 0 1 2 2v1"/></svg> Copy';btn.style.color='';btn.style.borderColor='';},2000);}).catch(()=>{btn.textContent='Copy failed';});}
  const hero=document.querySelector('.hero'),stickyCta=document.getElementById('sticky-cta');
  if(hero&&stickyCta){const obs=new IntersectionObserver(([e])=>{stickyCta.style.display=e.isIntersecting?'none':'flex';},{threshold:0});obs.observe(hero);}
</script>
</body>
</html>
```

No placeholder text in the written file. All 6 variables (REPO_NAME, VALUE_PROP, HERO_HEADLINE, CATEGORY_LABEL, MAIN_TRIGGER, INSTALL_CMD) must be substituted before writing.

**2. Commit and push:**
```bash
git -C <dir> add docs/
git -C <dir> commit -m "Add GitHub Pages landing site"
git -C <dir> push
```

**3. Enable Pages** (use `gh_safe` — POST mutation):
```bash
gh_safe repos/Rishiidev/REPO_NAME/pages \
  --method POST \
  --field source='{"branch":"main","path":"/docs"}' 2>/dev/null || echo "Pages already enabled"
```

**4. Set repo homepage** (use `gh_safe` — PATCH mutation):
```bash
gh_safe repos/Rishiidev/REPO_NAME --method PATCH \
  --field homepage="https://Rishiidev.github.io/REPO_NAME"
```

**5. Verify Pages deployment (poll up to 3 minutes):**
```bash
for i in $(seq 1 18); do
  STATUS=$(gh api repos/Rishiidev/REPO_NAME/pages --jq '.status' 2>/dev/null)
  echo "Pages status: $STATUS (check $i/18)"
  if [ "$STATUS" = "built" ]; then
    echo "✓ Pages live at https://Rishiidev.github.io/REPO_NAME"
    echo "pages_done:$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> <dir>/.launch-state
    break
  fi
  sleep 10
done
```
If status never reaches "built" after 3 minutes: tell the user
"Pages is deploying — it should be live at https://Rishiidev.github.io/REPO_NAME
within 2-5 minutes. Check github.com/Rishiidev/REPO_NAME/settings/pages for status."

**6. Custom domain (if CUSTOM_DOMAIN provided):**
```bash
echo "CUSTOM_DOMAIN" > <dir>/docs/CNAME
git -C <dir> add docs/CNAME
git -C <dir> commit -m "Add custom domain: CUSTOM_DOMAIN"
git -C <dir> push
gh repo edit Rishiidev/REPO_NAME --homepage "https://CUSTOM_DOMAIN"
```
Tell user DNS setup:
```
DNS — add ONE of these with your registrar:
  Subdomain (e.g. tools.yourdomain.com): CNAME → Rishiidev.github.io
  Apex domain (yourdomain.com): 4 A records →
    185.199.108.153  185.199.109.153  185.199.110.153  185.199.111.153
GitHub provisions HTTPS automatically (~10 min after DNS propagates).
```

---

## STEP: Discussions Welcome Post (if Discussions enabled)

```bash
REPO_NODE_ID=$(gh api graphql -f query='
  query { repository(owner: "Rishiidev", name: "REPO_NAME") { id } }
' --jq '.data.repository.id')

CATEGORY_ID=$(gh api graphql -f query='
  query {
    repository(owner: "Rishiidev", name: "REPO_NAME") {
      discussionCategories(first: 10) { nodes { id name } }
    }
  }
' --jq '.data.repository.discussionCategories.nodes[] | select(.name == "Announcements") | .id' | head -1)

# Fallback to General
[ -z "$CATEGORY_ID" ] && CATEGORY_ID=$(gh api graphql -f query='
  query {
    repository(owner: "Rishiidev", name: "REPO_NAME") {
      discussionCategories(first: 10) { nodes { id name } }
    }
  }
' --jq '.data.repository.discussionCategories.nodes[] | select(.name == "General") | .id' | head -1)

gh_safe graphql -f query='
  mutation($repoId: ID!, $catId: ID!, $title: String!, $body: String!) {
    createDiscussion(input: {
      repositoryId: $repoId
      categoryId: $catId
      title: $title
      body: $body
    }) { discussion { url } }
  }
' -f repoId="$REPO_NODE_ID" \
  -f catId="$CATEGORY_ID" \
  -f title="Welcome to REPO_NAME — introduce yourself" \
  -f body="Welcome! 👋

This is the place to share what you built, ask questions, and suggest improvements.

To kick things off:
- What are you using REPO_NAME for?
- What's your stack?
- What would make it 10x better?

I reply to every post."
```

If GraphQL fails → print manual fallback:
"Post a welcome thread manually at: https://github.com/Rishiidev/REPO_NAME/discussions/new"

---

## STEP: Validate Everything

Run all checks. Fix failures before reporting success.

```bash
gh repo view Rishiidev/REPO_NAME \
  --json name,description,topics,homepageUrl,hasDiscussionsEnabled,hasIssuesEnabled

TOPIC_COUNT=$(gh repo view Rishiidev/REPO_NAME --json topics | jq '.topics | length')
echo "Topics: $TOPIC_COUNT/20"

gh release view v1.0.0 --repo Rishiidev/REPO_NAME --json assets,tagName,name

gh issue list --repo Rishiidev/REPO_NAME --label "good first issue" --json number,title

gh label list --repo Rishiidev/REPO_NAME

gh workflow list --repo Rishiidev/REPO_NAME
```

Required passing state:
- topics count ≥ 15 (not 0) → if 0, Agent E likely failed: re-run topics command manually
- description matches REPO_DESC → if wrong, `gh repo edit --description "REPO_DESC"`
- release v1.0.0 exists → if missing, re-run Agent H command
- issue #1 has "good first issue" label → if missing, re-run Agent G step G2
- validate.yml workflow exists → if missing, write the file from Synthesis step 6

Report each as ✓ PASS or ✗ FAIL with the fix command.

---

## STEP: Demo Storyboard

Write `.github/record-demo.sh` (fill REPO_NAME, MAIN_TRIGGER):

```bash
#!/usr/bin/env bash
# record-demo.sh — 30-second terminal demo storyboard for REPO_NAME
#
# Recommended: asciinema rec demo.cast --cols 100 --rows 32 --idle-time-limit 2
#
# Scene 1 (0–5s): Type the trigger phrase
#   $ MAIN_TRIGGER
#   Pause 1s — show processing
#
# Scene 2 (5–15s): Show the primary output
#   [Show the most visually compelling output of REPO_NAME]
#   [Derive from CATEGORY: for claude-skill show agent output, for cli-tool show command output, etc.]
#
# Scene 3 (15–25s): Show the result / before→after
#   [Show the concrete improvement — time saved, output quality, etc.]
#
# Scene 4 (25–30s): Install command
#   $ INSTALL_CMD
#
# Recording tips:
#   - Font size 16, window 100x32, dark terminal (#0d1117)
#   - Export SVG: asciinema cat demo.cast | svg-term --out demo.svg
#   - Export GIF: agg demo.cast assets/demo.gif --cols 100 --rows 32

echo "Storyboard ready. Record with:"
echo "  asciinema rec demo.cast --cols 100 --rows 32 --idle-time-limit 2"
echo "  agg demo.cast assets/demo.gif"
```

---

## ═══════════════════════════════════════════════
## ═══ PARALLEL PHASE 3 ═══
## Distribution: spawn all 8 agents in ONE response.
## [LITE MODE: skip this entire section]
## ═══════════════════════════════════════════════

---

### Agent I — Reddit Post (r/ClaudeAI)

```
Write a Reddit post for r/ClaudeAI.
Repo: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME?utm_source=reddit
Value prop: VALUE_PROP
Before state: BEFORE_STATE
After state: AFTER_STATE
Install: INSTALL_CMD

TITLE: (≤120 chars — specific, no clickbait, include the repo name)
BODY: (400–600 words)
  Para 1: Mirror BEFORE_STATE — make it feel familiar to the reader
  Para 2: What REPO_NAME does — conversational, not marketing copy
  Before block: old workflow in code or plain text
  After block: new result
  Install command
  "Feedback welcome — especially edge cases I haven't hit yet" ending

Tone: developer sharing something they built. No superlatives. Concrete numbers only.
Return ready-to-paste post.
```

---

### Agent J — X/Twitter Thread

```
Write a 4-tweet thread about: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME?utm_source=twitter
Value prop: VALUE_PROP

1/4 (hook): [problem statement] + the number from VALUE_PROP + "how ↓"
2/4 (before/after): concrete gap — specific, shows the old vs new
3/4 (how it works): what happens under the hood, specific command or output snippet
4/4 (links): GitHub + INSTALL_CMD + "RT if this saves you [specific time/effort]"

Each ≤280 chars. Return numbered, ready-to-paste thread.
```

---

### Agent K — Hacker News Show HN

```
Write a Show HN submission for: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME?utm_source=hackernews
Value prop: VALUE_PROP

TITLE: Show HN: REPO_NAME – [value prop with number, ≤80 chars]
BODY: (~200 words, 3 paragraphs)
  P1: Problem and why I built it — honest, not marketing
  P2: Technical approach — how it works, what's interesting about it
  P3: GitHub link, INSTALL_CMD, specific feedback request

Audience: technical, skeptical. No superlatives. Numbers are fine. Let the use case speak.
Return ready-to-post submission.
```

---

### Agent L — Awesome-List PR Draft

```
Find the best awesome-list target for: REPO_NAME (category: CATEGORY)
Run:
gh search repos "awesome-claude" --sort stars --limit 5 --json fullName,stargazersCount,description
gh search repos "awesome-llm" --sort stars --limit 5 --json fullName,stargazersCount,description
gh search repos "awesome-claude-code" --sort stars --limit 3 --json fullName,stargazersCount,description

Pick the best target (highest stars + most relevant to CATEGORY).
Fetch its README first 50 lines to match description style:
gh api repos/<owner>/<repo>/readme --jq '.content' | base64 -d | head -50

Write:
1. The exact markdown line: - [REPO_NAME](https://github.com/Rishiidev/REPO_NAME) — description matching list style
2. PR title: "Add REPO_NAME"
3. PR body (3 sentences: what it does, category, why it belongs here)

Return: target repo URL, the markdown line, full PR draft.
```

---

### Agent M — LinkedIn Post

```
Write a LinkedIn post for: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME?utm_source=linkedin
Value prop: VALUE_PROP
Before state: BEFORE_STATE

FORMAT:
- Hook (1 sentence ending with a number or contrast — no "I'm excited to announce")
- Blank line
- 3-4 bullets on the technical approach
- Blank line
- GitHub link + INSTALL_CMD
- 3-5 hashtags: #ClaudeAI #AITools #DeveloperTools + 1-2 stack-specific

150–250 words. Technical professional tone. No corporate speak.
Return ready-to-paste post.
```

---

### Agent N — Product Hunt Launch Copy

```
Write Product Hunt assets for: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME?utm_source=producthunt
Value prop: VALUE_PROP

Provide:
1. TAGLINE (≤60 chars): one-liner for the PH listing
2. DESCRIPTION (≤260 chars): what it does + who it's for + one concrete benefit
3. FIRST COMMENT (200–300 words):
   - Why you built it (honest reason — not marketing)
   - What makes the approach technically interesting
   - One surprising result from building or testing it
   - Specific feedback request: what would YOU add next?
4. GALLERY SLIDE CAPTIONS (3 slides):
   Slide 1: The problem (BEFORE_STATE condensed)
   Slide 2: How it works (architecture or pipeline)
   Slide 3: Install command + what you get

Return all 4 items labeled.
```

---

### Agent O — Newsletter Pitch Emails

```
Write 3 tailored pitches for: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME
Value prop: VALUE_PROP

1. TLDR AI (tldr.tech/ai)
   Subject: ≤60 chars, no punctuation theatrics
   Body: 60–80 words, factual, headline-friendly, data-driven

2. The Rundown AI (therundown.ai)
   Subject: ≤60 chars
   Body: 2 short paragraphs, ~100 words, "what's new" angle

3. Ben's Bites (bensbites.co)
   Subject: ≤60 chars
   Body: 60–80 words, casual builder energy, "someone just shipped..." tone

Each pitch includes the GitHub URL and INSTALL_CMD.
Do not send the same copy to all three. Tailor each to the newsletter's voice.
Return all 3 labeled.
```

---

### Agent P — DEV.to Article Draft

```
Write a DEV.to article about: Rishiidev/REPO_NAME
GitHub: https://github.com/Rishiidev/REPO_NAME?utm_source=devto
Value prop: VALUE_PROP
Install: INSTALL_CMD

TITLE: ≤80 chars, include the number from VALUE_PROP
TAGS: 4 tags (e.g. claudeai, opensource, devtools, productivity)
COVER_ALT: descriptive alt text for the social-preview.svg

ARTICLE (700–900 words):

## The Problem
[BEFORE_STATE — concrete, 2-3 sentences]

## The Approach
[Technical explanation of how REPO_NAME works. Be honest about trade-offs.]

## What You Get
[File tree or feature list — specific to this project, not a generic list]

## Try It
\`\`\`
INSTALL_CMD
\`\`\`
Then: MAIN_TRIGGER

## What's Next
[1-2 improvements or open issues — honest about limitations]

End with: star the repo link + open an issue for feedback.
Return full article in Markdown, ready to paste into DEV.to.
```

---

**After all Phase 3 agents complete — write checkpoint:**
```bash
echo "phase3_done:$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> <project-dir>/.launch-state
```

---

## STEP: 7-Day Launch Calendar

After all 8 Phase 3 agents complete, build this calendar using TODAY as the base date.
Compute absolute dates: Day 0 = TODAY, Day 1 = tomorrow, etc.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📅  7-DAY LAUNCH CALENDAR — REPO_NAME
    Starting: TODAY (Day 0)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Day 0 — TODAY
  □ Pin repo on GitHub profile (github.com → Customize profile)
  □ Add repo URL to GitHub bio
  □ Star your own repo (seeds the star history chart)
  □ Post LinkedIn [Agent M post below ↓] (9–10am local)
  □ Send newsletter pitches [Agent O below ↓]

Day 1 — [TODAY + 1 day] (Post 9–11am ET)
  □ Post r/ClaudeAI [Reddit post from Agent I below ↓]
  □ Reply to every comment within 2 hours

Day 2 — [TODAY + 2 days] (Post 8–10am or 5–6pm ET)
  □ Post X/Twitter thread [Agent J below ↓]
  □ @AnthropicAI mention if on-topic

Day 3 — [TODAY + 3 days]
  □ Open awesome-list PR [Agent L target + PR below ↓]
  □ Post in Claude/AI developer Discord communities
  □ Publish DEV.to article [Agent P below ↓]

Day 4 — [TODAY + 4 days]
  □ IF ≥5 stars: submit to Product Hunt [Agent N below ↓]
     Best window: 12:01am PT (Pacific midnight)
     producthunt.com/posts/new

Day 5 — [TODAY + 5 days]
  □ IF ≥10 stars: post Show HN [Agent K below ↓]
     Wait for social proof — HN with 0 stars is invisible
  □ Cross-post to r/artificial with a different angle

Day 7 — [TODAY + 7 days]
  □ Search "REPO_NAME" on GitHub — are you ranking?
  □ If <5 stars: try the next description candidate
  □ If ≥20 stars: follow up on any newsletter replies

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

LINKEDIN POST (Day 0):
[Agent M output]

REDDIT POST (Day 1 — r/ClaudeAI):
[Agent I output]

TWITTER THREAD (Day 2):
[Agent J output]

DEV.to ARTICLE (Day 3):
[Agent P output]

PRODUCT HUNT (Day 4, after 5★):
Tagline: [Agent N tagline]
Description: [Agent N description]
First comment: [Agent N first comment]
Gallery captions: [Agent N captions]

SHOW HN (Day 5, after 10★):
[Agent K output]

AWESOME-LIST PR (Day 3):
Target: [Agent L target repo]
Markdown line: [Agent L line]
PR body: [Agent L PR body]

NEWSLETTER PITCHES (Day 0 — send all 3):
[Agent O output]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## STEP: Final Report

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✓ Repo:        https://github.com/Rishiidev/REPO_NAME
✓ Website:     https://Rishiidev.github.io/REPO_NAME  [or CUSTOM_DOMAIN]
✓ Install:     INSTALL_CMD
✓ Name score:  X/20 — [reason it was chosen]
✓ Description: REPO_DESC
✓ Topics:      N/20 set
✓ README:      SVG embedded ✓  Competitor patterns applied ✓
✓ CI badge:    validate.yml active
✓ JSON lint:   all .json files valid ✓
✓ Discussions: [enabled / skipped]
✓ Labels:      5 created
✓ Issue #1:    [title]
✓ Release:     v1.0.0 [with/without .skill]
✓ Pages:       [live / deploying] → [URL]
✓ Validation:  all 7 checks passed
✓ Sponsor btn: FUNDING.yml active
✓ SVG content: project-specific (no template placeholder text) ✓

AGENTS SPAWNED:  16 (A–P) [or 13 in LITE mode]
PARALLEL PHASES: 3 (Phase 1: research/gen, Phase 2: config, Phase 3: distribution)
ESTIMATED TIME:  ~4–6 minutes (full) · ~2 minutes (LITE)

LAUNCH ORDER (7-day calendar above):
LinkedIn + Newsletters (Day 0) → Reddit (Day 1) → X/Twitter (Day 2)
→ Awesome-list PR + DEV.to (Day 3) → Product Hunt (Day 4, after 5★)
→ HN (Day 5, after 10★)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## ═══════════════════════════════════════════════
## ═══ IMPROVE MODE ═══
## For repos that already exist. Never overwrites without showing a diff.
## ═══════════════════════════════════════════════

---

### IMPROVE STEP 1 — Repo Discovery

Ask ONE question if not already known from context:

```
Which repo do you want to improve?
(Paste the GitHub URL, repo name, or path to the local directory)
```

Then run:

```bash
# Resolve repo identity
REPO_URL="<provided URL or Rishiidev/REPO_NAME>"

# Fetch current GitHub metadata
gh repo view "$REPO_URL" \
  --json name,description,topics,homepageUrl,hasDiscussionsEnabled,hasIssuesEnabled,\
stargazerCount,forkCount,pushedAt,defaultBranchRef \
  2>/dev/null

# Check for local directory
ls <local-dir> 2>/dev/null && git -C <local-dir> log --oneline -3 2>/dev/null

# Check resume state
STATE=<local-dir>/.launch-state
[ -f "$STATE" ] && echo "=== Existing improve state ===" && cat "$STATE"
```

Store: `REPO_NAME`, `REPO_OWNER` (Rishiidev), `LOCAL_DIR` (if available), `TODAY`.

---

### IMPROVE STEP 2 — Parallel Audit

## ═══ PARALLEL AUDIT ═══
## Spawn all 6 audit agents in ONE response now.
## ═══════════════════════════════════════════════

---

#### Agent AUD-A — File + README Deep Audit

```
You are auditing the files and README quality in an existing GitHub repo.
Repo: REPO_OWNER/REPO_NAME
Local dir (if available): LOCAL_DIR

Fetch all top-level files and key nested files:
gh api repos/REPO_OWNER/REPO_NAME/contents/ --jq '.[].name'
gh api repos/REPO_OWNER/REPO_NAME/git/trees/HEAD?recursive=1 --jq '.tree[].path' 2>/dev/null | head -60

For each file that exists, fetch and read it:
README=$(gh api repos/REPO_OWNER/REPO_NAME/contents/README.md --jq '.content' | base64 -d)
gh api repos/REPO_OWNER/REPO_NAME/contents/CHANGELOG.md --jq '.content' 2>/dev/null | base64 -d | head -30
gh api repos/REPO_OWNER/REPO_NAME/contents/CONTRIBUTING.md --jq '.content' 2>/dev/null | base64 -d | head -20
gh api repos/REPO_OWNER/REPO_NAME/contents/SECURITY.md --jq '.content' 2>/dev/null | base64 -d | head -10
gh api repos/REPO_OWNER/REPO_NAME/contents/.github/FUNDING.yml --jq '.content' 2>/dev/null | base64 -d

Detect CI last-run status:
gh api repos/REPO_OWNER/REPO_NAME/actions/runs?per_page=1 \
  --jq '.workflow_runs[0] | {name: .name, status: .status, conclusion: .conclusion, updated_at: .updated_at}' 2>/dev/null || echo "No CI runs found"

Detect freshness gap — compare README commit date vs repo's last push:
README_COMMIT_DATE=$(gh api repos/REPO_OWNER/REPO_NAME/commits?path=README.md\&per_page=1 \
  --jq '.[0].commit.committer.date' 2>/dev/null)
LAST_PUSH=$(gh api repos/REPO_OWNER/REPO_NAME --jq '.pushed_at' 2>/dev/null)
# Compute difference in days (README_COMMIT_DATE vs LAST_PUSH)
# freshness_gap_days = days since README was last updated vs last code commit

Scan README for broken links (http/https links that return 4xx):
Extract all URLs from README with grep, then check each with curl -s -o /dev/null -w "%{http_code}" --max-time 5 <URL>
Only report URLs that return 404 or connection error. Limit to 10 checks max.

Check for demo GIF or screenshot in README:
Look for .gif extensions, "demo", "screenshot", "preview" in image src attributes.
Also check if assets/ directory has any .gif files:
gh api repos/REPO_OWNER/REPO_NAME/contents/assets/ --jq '[.[].name | select(endswith(".gif") or endswith(".mp4"))]' 2>/dev/null

Check for "who is this for" sentence:
Scan README for phrases: "for developers", "for teams", "designed for", "built for", "perfect for", "ideal for", "made for"

Return JSON:
{
  "existing_files": ["README.md", "LICENSE", ...],
  "missing_standard_files": ["SECURITY.md", "FUNDING.yml", ...],
  "readme_exists": true,
  "readme_has_svg": true/false,
  "readme_has_install_table": true/false,
  "readme_has_value_prop_number": true/false,
  "readme_has_star_cta_before_features": true/false,
  "readme_has_before_after": true/false,
  "readme_has_star_history": true/false,
  "readme_has_badges": true/false,
  "readme_has_demo_gif": true/false,
  "readme_has_targeting_sentence": true/false,
  "social_preview_exists": true/false,
  "social_preview_is_self_referential": true/false,
  "pages_site_exists": true/false,
  "ci_workflow_exists": true/false,
  "ci_last_run_status": "success | failure | in_progress | no_ci",
  "freshness_gap_days": 14,
  "broken_links": ["https://example.com/dead-link"],
  "broken_links_count": 2,
  "plugin_json_exists": true/false,
  "issue_templates_exist": true/false,
  "pr_template_exists": true/false,
  "skill_md_exists": true/false,
  "readme_raw": "<first 2000 chars of README for scoring>",
  "stack": "<detected from package.json/requirements.txt/go.mod/Cargo.toml/SKILL.md>"
}
```

---

#### Agent AUD-B — GitHub Metadata + Velocity Audit

```
You are auditing GitHub metadata and growth signals for: REPO_OWNER/REPO_NAME

Run these read-only commands:

gh api repos/REPO_OWNER/REPO_NAME \
  --jq '{desc: .description, topics: .topics, homepage: .homepage,
         stars: .stargazers_count, forks: .forks_count,
         discussions: .has_discussions, issues: .has_issues,
         created_at: .created_at, pushed_at: .pushed_at,
         allow_squash_merge: .allow_squash_merge,
         delete_branch_on_merge: .delete_branch_on_merge}'

gh label list --repo REPO_OWNER/REPO_NAME --json name,color

gh release list --repo REPO_OWNER/REPO_NAME --limit 5 --json tagName,name,publishedAt

gh issue list --repo REPO_OWNER/REPO_NAME --label "good first issue" --limit 5 --json number,title

gh api repos/REPO_OWNER/REPO_NAME/pages --jq '{status: .status, url: .html_url}' 2>/dev/null || echo "Pages: not enabled"

# Check branch protection on default branch:
DEFAULT_BRANCH=$(gh api repos/REPO_OWNER/REPO_NAME --jq '.default_branch')
gh api repos/REPO_OWNER/REPO_NAME/branches/$DEFAULT_BRANCH/protection 2>/dev/null | jq '{required_reviews: .required_pull_request_reviews.required_approving_review_count, enforce_admins: .enforce_admins.enabled}' || echo "No branch protection"

# Check Dependabot alerts enabled:
gh api repos/REPO_OWNER/REPO_NAME/vulnerability-alerts 2>/dev/null && echo "dependabot:enabled" || echo "dependabot:disabled"

# Check CI badge presence in README vs actual CI status:
# (Look for badge URLs in README that reference /actions/workflows/ or shields.io/github/actions)
gh api repos/REPO_OWNER/REPO_NAME/contents/README.md --jq '.content' | base64 -d | grep -oE "!\[.{0,40}\]\(https://[^)]+\)" | head -5

# Detect previously-tried distribution channels (search recent issues/discussions):
gh issue list --repo REPO_OWNER/REPO_NAME --state all --limit 20 --json title,body 2>/dev/null \
  | jq '[.[] | select((.title + " " + .body) | test("reddit|product hunt|show hn|hackernews|devto|twitter|linkedin"; "i"))]' 2>/dev/null | head -5

Compute star velocity:
STARS = stargazers_count
CREATED = created_at (parse to days)
REPO_AGE_WEEKS = (TODAY - created_at) / 7
STAR_VELOCITY = STARS / REPO_AGE_WEEKS (round to 1 decimal)

Return JSON:
{
  "description": "<current description or null>",
  "description_has_number": true/false,
  "description_length": 42,
  "topics": ["existing", "topics"],
  "topic_count": 5,
  "homepage_set": true/false,
  "homepage_url": "<url or null>",
  "star_count": 12,
  "star_velocity_per_week": 1.4,
  "repo_age_weeks": 8.5,
  "has_discussions": true/false,
  "has_issues": true/false,
  "labels": [{"name": "bug", "color": "d73a4a"}, ...],
  "missing_standard_labels": ["good first issue", "documentation", ...],
  "has_good_first_issue": true/false,
  "latest_release": {"tag": "v1.0.0", "published": "2026-06-10"} or null,
  "releases_count": 2,
  "pages_status": "built" or "not enabled",
  "pages_url": "<url or null>",
  "branch_protection_enabled": true/false,
  "delete_branch_on_merge": true/false,
  "squash_merge_enabled": true/false,
  "dependabot_enabled": true/false,
  "previously_tried_channels": ["reddit", "twitter"],
  "ci_badge_in_readme": true/false,
  "ci_badge_matches_status": true/false
}
```

---

#### Agent AUD-C — README Quality Scorer (15 Dimensions)

```
You are scoring the quality of an existing README.
Repo: REPO_OWNER/REPO_NAME

Fetch the full README:
README=$(gh api repos/REPO_OWNER/REPO_NAME/contents/README.md --jq '.content' | base64 -d)

First detect the README's dominant tone:
- technical: heavy code blocks, API references, flag tables, minimal prose
- tutorial: step-by-step numbered instructions, "first do X, then Y" structure
- terse: bullet-heavy, very short sentences, minimal explanation
- marketing: benefit statements, emotional language, social proof, CTA-first
Store as DETECTED_TONE.

Score on 15 dimensions (points per dimension shown):

  [2pts] Social preview: embedded <img src="assets/...svg"> or <img> in first div
  [2pts] Value prop with a number: headline or first blockquote contains a digit
  [1pt]  Star CTA before first table or feature list
  [2pts] Install section: has a code block or table with an install command
  [1pt]  Before/after or Problem/Fix section
  [1pt]  Star history chart (star-history.com badge)
  [1pt]  Badges (CI, license, stars) in header
  [1pt]  Demo GIF or screenshot showing the tool in action
  [1pt]  Targeting sentence: "for developers who...", "built for teams that...", "perfect for..."
  [1pt]  Comparative or benchmark claim: "X times faster", "replaces Y", "unlike Z"
  [1pt]  Link to CONTRIBUTING.md or contribution guide
  [1pt]  Code of Conduct mention or link
  [1pt]  Quick reference table (flags/options/API methods) if CLI or API project
  [1pt]  FAQ or Troubleshooting section
  [1pt]  License badge or license section at bottom

Total: /18

For each gap, generate a TONE-AWARE specific fix using DETECTED_TONE.
A technical README gets technical-sounding fixes. A marketing README gets CTA-forward fixes.
Do NOT write generic fixes. Derive the exact content from the actual README.

Return JSON:
{
  "readme_score": 9,
  "readme_score_max": 18,
  "detected_tone": "technical | tutorial | terse | marketing",
  "gaps": [
    {
      "dimension": "Social preview",
      "score": 0,
      "max_score": 2,
      "severity": "critical",
      "fix": "Add as first element inside <div align=\"center\">:\n<img src=\"assets/social-preview.svg\" alt=\"REPO_NAME\" width=\"100%\"/>",
      "tone_note": "Precedes all text — tone-neutral"
    },
    {
      "dimension": "Demo GIF",
      "score": 0,
      "max_score": 1,
      "severity": "medium",
      "fix": "Add a demo GIF showing the core workflow. For technical tone: show terminal output. For marketing tone: show before/after result.",
      "tone_note": "For technical tone, prefer asciinema-style recording"
    },
    ...
  ],
  "sections_present": ["Install", "How It Works", "License"],
  "sections_missing": ["The Problem", "Star History", "FAQ"],
  "estimated_score_after_fixes": 16,
  "estimated_improvement": "Score could reach 16/18 with 4 targeted fixes"
}
```

---

#### Agent AUD-D — Distribution + Growth Diagnosis

```
You are diagnosing distribution readiness and growth signals for: REPO_OWNER/REPO_NAME

Run:
gh api repos/REPO_OWNER/REPO_NAME \
  --jq '{stars: .stargazers_count, forks: .forks_count, watchers: .watchers_count,
         created: .created_at, pushed: .pushed_at}'

gh api repos/REPO_OWNER/REPO_NAME/topics --jq '.names'

gh search repos "REPO_NAME" --sort stars --limit 5 --json name,stargazersCount,description 2>/dev/null

Check if social preview SVG exists and if it matches standard template:
gh api repos/REPO_OWNER/REPO_NAME/contents/assets/social-preview.svg --jq '.content' 2>/dev/null | base64 -d | head -5

# Check traffic data (requires push access):
gh api repos/REPO_OWNER/REPO_NAME/traffic/views --jq '{count: .count, uniques: .uniques}' 2>/dev/null || echo "Traffic: not accessible"
gh api repos/REPO_OWNER/REPO_NAME/traffic/clones --jq '{count: .count, uniques: .uniques}' 2>/dev/null || echo "Clones: not accessible"
gh api repos/REPO_OWNER/REPO_NAME/traffic/popular/referrers --jq '.[0:5]' 2>/dev/null || echo "Referrers: not accessible"

Diagnose star velocity:
STARS = stargazers_count
REPO_AGE_WEEKS from AUD-B
STAR_VELOCITY = STARS / REPO_AGE_WEEKS
If STAR_VELOCITY < 1: "Reach problem — the right people haven't seen it yet. Fix discoverability (topics, description, distribution)."
If STAR_VELOCITY ≥ 1 and STAR_VELOCITY < 5: "Resonance problem — people are landing but not starring. Fix README clarity and value prop."
If STAR_VELOCITY ≥ 5: "Growth is healthy. Focus on sustaining distribution cadence."

Diagnose reach vs resonance:
UNIQUES = traffic.uniques (14-day window)
STARS = stargazers_count
If UNIQUES available:
  STAR_RATE = STARS / UNIQUES
  If STAR_RATE < 0.02: "Resonance problem — <2% of visitors star. README or value prop needs work."
  If STAR_RATE ≥ 0.02: "Reach problem — conversion is fine, just need more visitors."
Else: "Traffic data unavailable — diagnose by checking referrers and star velocity instead."

Detect already-tried distribution channels from AUD-B previously_tried_channels.
Do NOT recommend channels already tried — focus on untapped ones.

Return JSON:
{
  "star_count": 3,
  "star_velocity_per_week": 0.4,
  "growth_diagnosis": "reach | resonance | healthy",
  "growth_explanation": "0.4 stars/week — the right people haven't seen this yet. Focus on topics + Reddit.",
  "traffic_views_14d": 42,
  "traffic_uniques_14d": 28,
  "star_conversion_rate": 0.04,
  "top_referrers": ["github.com", "google.com"],
  "distribution_unlocked": {
    "reddit": true,
    "linkedin": true,
    "twitter": true,
    "devto": true,
    "product_hunt": false,
    "show_hn": false
  },
  "untapped_channels": ["devto", "product_hunt"],
  "previously_tried_channels": ["reddit"],
  "social_preview_quality": "missing | self_referential | generic | good",
  "searchability_score": 4,
  "topic_gap_count": 15,
  "repo_age_days": 8,
  "days_since_last_push": 2,
  "distribution_recommendation": "Reach problem. Fix topics first (0 → 20), then post Dev.to article. Save PH for when you hit 5 stars."
}
```

---

#### Agent AUD-E — Competitive Benchmark (NEW)

```
You are benchmarking REPO_OWNER/REPO_NAME against the top 3 similar repos.

Step 1: Find top 3 competitors:
gh search repos --topic <primary_topic_from_AUD-B> --sort stars --limit 5 --json name,fullName,stargazersCount,description,topics 2>/dev/null
# Also try searching by repo name keywords:
gh search repos "REPO_NAME_KEYWORDS" --sort stars --limit 5 --json name,fullName,stargazersCount,description,topics 2>/dev/null

Pick the top 3 by stars that are NOT REPO_OWNER/REPO_NAME.
Store as COMPETITOR_1, COMPETITOR_2, COMPETITOR_3.

Step 2: Mine each competitor's README:
For each COMPETITOR:
  README=$(gh api repos/COMPETITOR/contents/README.md --jq '.content' 2>/dev/null | base64 -d | head -100)
  TOPICS=$(gh api repos/COMPETITOR/topics --jq '.names' 2>/dev/null)
  
  Extract:
  - Does it have a demo GIF? (look for .gif in img tags)
  - Does it have a comparison table? (look for | ---|)
  - Does it have a "Quick Start" section?
  - Does it use a star history chart?
  - What are its first 5 topics?
  - What is its headline (first H1 or first line after logo)?
  - Does it quantify its value prop (contains a number in headline)?

Step 3: Identify patterns present in ≥2 competitors that REPO_OWNER/REPO_NAME is MISSING.
These are the highest-signal gaps — competitors found these patterns worth including.

Return JSON:
{
  "competitors": [
    {
      "full_name": "owner/repo",
      "stars": 1240,
      "description": "...",
      "topics": ["topic1", "topic2"],
      "has_demo_gif": true,
      "has_comparison_table": false,
      "has_quick_start": true,
      "has_star_history": true,
      "headline": "Ship your CLI in 5 minutes",
      "has_number_in_headline": true
    },
    ...
  ],
  "competitor_topics_pool": ["topic1", "topic2", "topic3", ...],
  "patterns_in_2_plus_competitors": ["demo_gif", "star_history", "quick_start"],
  "patterns_missing_in_target": ["demo_gif", "comparison_table"],
  "competitor_headline_patterns": [
    "All 3 use a number in the headline",
    "2/3 lead with a time-saving claim"
  ],
  "recommended_topics_from_competitors": ["topic-a", "topic-b", "topic-c"],
  "benchmark_summary": "Your repo is missing demo_gif and star_history — both present in all 3 top competitors."
}
```

---

#### Agent AUD-F — Consistency & Freshness Audit (NEW)

```
You are checking version consistency and file freshness across all version sources.
Repo: REPO_OWNER/REPO_NAME
Local dir (if available): LOCAL_DIR

Step 1: Collect version strings from every source:

# package.json (Node)
gh api repos/REPO_OWNER/REPO_NAME/contents/package.json --jq '.content' 2>/dev/null | base64 -d | jq -r '.version' 2>/dev/null || echo "no package.json"

# pyproject.toml (Python)
gh api repos/REPO_OWNER/REPO_NAME/contents/pyproject.toml --jq '.content' 2>/dev/null | base64 -d | grep -E "^version\s*=" | head -1 2>/dev/null || echo "no pyproject.toml"

# go.mod (Go — use module path, not version)
gh api repos/REPO_OWNER/REPO_NAME/contents/go.mod --jq '.content' 2>/dev/null | base64 -d | head -3 2>/dev/null || echo "no go.mod"

# Cargo.toml (Rust)
gh api repos/REPO_OWNER/REPO_NAME/contents/Cargo.toml --jq '.content' 2>/dev/null | base64 -d | grep "^version" | head -1 2>/dev/null || echo "no Cargo.toml"

# Latest git tag:
gh api repos/REPO_OWNER/REPO_NAME/tags --jq '.[0].name' 2>/dev/null || echo "no tags"

# Latest GitHub release:
gh api repos/REPO_OWNER/REPO_NAME/releases/latest --jq '.tag_name' 2>/dev/null || echo "no releases"

# Version in README install command:
gh api repos/REPO_OWNER/REPO_NAME/contents/README.md --jq '.content' | base64 -d \
  | grep -oE "(v?[0-9]+\.[0-9]+\.[0-9]+)" | head -3 2>/dev/null || echo "no version in README"

Step 2: Collect file freshness signals:
gh api repos/REPO_OWNER/REPO_NAME/commits?path=CHANGELOG.md\&per_page=1 --jq '.[0].commit.committer.date' 2>/dev/null || echo "no CHANGELOG commits"
gh api repos/REPO_OWNER/REPO_NAME/commits?path=README.md\&per_page=1 --jq '.[0].commit.committer.date' 2>/dev/null
gh api repos/REPO_OWNER/REPO_NAME/commits?path=CONTRIBUTING.md\&per_page=1 --jq '.[0].commit.committer.date' 2>/dev/null || echo "no CONTRIBUTING"
LAST_PUSH=$(gh api repos/REPO_OWNER/REPO_NAME --jq '.pushed_at')

Step 3: Compare all version strings. Identify mismatches.
A mismatch is when two sources that should agree on version contain different version strings.

Return JSON:
{
  "version_sources": {
    "package_json": "1.2.0",
    "pyproject_toml": null,
    "go_mod": null,
    "cargo_toml": null,
    "latest_git_tag": "v1.1.0",
    "latest_github_release": "v1.1.0",
    "readme_install_command": "1.0.0"
  },
  "version_mismatches": [
    {"source_a": "package_json", "version_a": "1.2.0", "source_b": "latest_git_tag", "version_b": "v1.1.0", "severity": "critical"},
    {"source_a": "readme_install_command", "version_a": "1.0.0", "source_b": "latest_github_release", "version_b": "v1.1.0", "severity": "medium"}
  ],
  "version_mismatch_count": 2,
  "canonical_version_recommendation": "v1.2.0",
  "file_freshness": {
    "readme_last_updated_days_ago": 14,
    "changelog_last_updated_days_ago": 30,
    "contributing_last_updated_days_ago": null,
    "last_code_push_days_ago": 2
  },
  "stale_files": ["CHANGELOG.md (30 days behind last push)", "README.md (14 days behind)"],
  "freshness_verdict": "CHANGELOG is 30 days stale — needs a new version entry. README is 12 days behind last code push."
}
```

---

### IMPROVE STEP 3 — ROI Gap Analysis + User Confirmation

After all 6 audit agents complete, synthesize into an **ROI-scored punch list**.

For each gap, compute:
- **Impact** (1–5): how much this gap hurts discoverability, conversion, or trust
- **Effort** (1–5): how many steps to fix (1 = one command, 5 = requires significant work)
- **ROI** = (Impact ÷ Effort) × 10 — higher is better

Sort all gaps by ROI descending. Mark items with ROI ≥ 8 AND Effort ≤ 2 as **Quick Wins**.

Compute Health Score:
- Current: sum of points actually present across AUD-C's 18 dimensions + AUD-B metadata score (topics/20 × 5 + description_has_number × 3 + has_release × 2 = max 10) + AUD-F consistency (no mismatches = 5, each mismatch -2, min 0) = max 33
- Scale to 100: (raw/33) × 100, round to nearest integer
- Projected: after applying all gaps in the punch list

Format and present this to the user:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔍  REPO HEALTH CHECK — REPO_OWNER/REPO_NAME
    Stars: N (VELOCITY/wk) · Topics: N/20 · README: N/18
    Growth: GROWTH_DIAGNOSIS (reach | resonance | healthy)
    Health Score: CURRENT_SCORE/100 → PROJECTED_SCORE/100
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

⚡ QUICK WINS — high ROI, low effort (do these first)
  □ [ROI 9.0] 0 topics → add 20 topics  (Impact 5, Effort 1)
  □ [ROI 8.0] Description missing number → add one number  (Impact 4, Effort 1)
  □ [ROI 8.0] Broken link in README (2 found) → remove/fix  (Impact 4, Effort 1)

📊 ALL GAPS — sorted by ROI
  [ROI N.N] [gap title] — [specific detail from audit]  (Impact N, Effort N)
  [ROI N.N] Version mismatch: package.json 1.2.0 vs git tag v1.1.0  (Impact 4, Effort 2)
  [ROI N.N] No demo GIF — competitors 2/3 have one  (Impact 3, Effort 3)
  [ROI N.N] CI last run: FAILED — badge shows passing  (Impact 4, Effort 4)
  [ROI N.N] No CONTRIBUTING.md → discourages contributors  (Impact 2, Effort 2)
  [ROI N.N] No GitHub Pages site  (Impact 2, Effort 5)
  ... [all gaps listed with ROI]

🏆 COMPETITOR BENCHMARK  (from AUD-E)
  Top competitor: COMPETITOR_1 (N stars)
  You're missing: PATTERN_A, PATTERN_B — both in ≥2 top repos

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Fix all? (recommended) · Quick wins only · Pick by number
```

Wait for user response. Store confirmed gap list as `CONFIRMED_GAPS`.

If user says "all" → `CONFIRMED_GAPS = all gaps above`
If user says "quick wins" → `CONFIRMED_GAPS = items marked Quick Win`
If user picks by number → `CONFIRMED_GAPS = selected numbered items`

---

### IMPROVE STEP 4 — Selective Parallel Fixes

**Read this mapping and spawn ONLY the agents needed for CONFIRMED_GAPS.**
Spawn all applicable fix agents in a SINGLE response (parallel).

| Gap | Fix agent to spawn |
|-----|-------------------|
| README score < 14/18 | **Agent FIX-README** |
| Topics < 15 | **Agent FIX-TOPICS** |
| Description weak/missing | **Agent FIX-DESC** |
| No social preview OR self-referential SVG | **Agent FIX-SVG** (same as Agent C from launch) |
| No GitHub Pages | Run Pages step from launch mode |
| Missing standard files (SECURITY, FUNDING, etc.) | **Agent FIX-FILES** |
| Missing standard labels | **Agent FIX-LABELS** |
| No good-first-issue | **Agent FIX-ISSUE** |
| No release / outdated release | **Agent FIX-RELEASE** |
| Version mismatches across sources | **Agent FIX-CONSISTENCY** |
| Branch protection / repo settings not optimized | **Agent FIX-SETTINGS** |
| CHANGELOG stale or missing | **Agent FIX-CHANGELOG** |
| Distribution content needed | Spawn relevant Phase 3 agents (I–P) |

---

#### Agent FIX-README — Non-destructive README Improvement

```
You are improving an existing README without replacing it.
Repo: REPO_OWNER/REPO_NAME
Current README score: N/18
Detected tone: DETECTED_TONE (from AUD-C)
Confirmed gaps to fix: [list from AUD-C gaps where dimension matches CONFIRMED_GAPS]
Competitor patterns to use: PATTERNS_MISSING_IN_TARGET (from AUD-E)
Competitor topics pool: COMPETITOR_TOPICS_POOL (from AUD-E)

Fetch the current README:
README=$(gh api repos/REPO_OWNER/REPO_NAME/contents/README.md --jq '.content' | base64 -d)

TONE RULES — apply throughout all proposed fixes:
- technical tone: use precise language, show exact commands, avoid marketing superlatives
- tutorial tone: use numbered steps, "Next, do X" transitions, "You should see Y" confirmations
- terse tone: bullets only, no explanatory prose, shortest possible phrasing
- marketing tone: lead with benefit not feature, include social proof, every section has a CTA

COMPETITOR INTEGRATION:
For any gap also present in competitor patterns (from AUD-E patterns_missing_in_target),
note in the fix: "Competitors with this: N/3"
Use competitor_topics_pool as seed for topic suggestions within README text.
If competitors use demo GIFs, propose a terminal recording approach matched to the stack.

For EACH confirmed gap:
1. Show the CURRENT content for that section (or "section missing")
2. Show the PROPOSED replacement/addition — written in DETECTED_TONE
3. Mark: ADD (new section) or REPLACE (changes existing content)
4. Note competitor signal if applicable

Format each as:

--- FIX N: [gap name] ([ADD/REPLACE]) — ROI: N.N ---
CURRENT:
<current content or "not present">

PROPOSED:
<exact markdown to add or substitute — written in DETECTED_TONE>

IMPACT: [one sentence on why this improves discoverability or conversion]
COMPETITOR SIGNAL: [e.g. "Present in 3/3 top competitors" or "n/a"]
---

Rules:
- Never rewrite sections that score well — only touch confirmed gaps
- For SVG: place BEFORE any existing content in the header div, not after
- For star CTA: insert BEFORE the first table, not at the end
- For value prop: improve the EXISTING headline, do not add a new one above it
- For missing sections (Problem, Star History, FAQ): append after the closest related section
- For demo GIF gap: propose recording command appropriate for stack (asciinema for CLI, screen capture for GUI)
- For targeting sentence: add to existing intro paragraph, not as separate section
- Preserve all existing content that isn't being replaced
- Show the full before/after for REPLACE operations — never a partial diff

After showing all proposed fixes, ask:
"Apply all N fixes? Or say which numbers to skip."

Wait for confirmation. Then apply only confirmed fixes to the README in memory.
Write the updated README to disk only after confirmation.
```

---

#### Agent FIX-TOPICS — Topic Gap Filler

```
You are adding missing topics to: REPO_OWNER/REPO_NAME
Current topics: [from AUD-B topics]
Competitor topics pool: COMPETITOR_TOPICS_POOL (from AUD-E — high-signal seeds)
Target: 20 topics

Get the current topic list:
gh api repos/REPO_OWNER/REPO_NAME/topics --jq '.names'

TOPIC STRATEGY — three layers:
1. Competitor-validated (from AUD-E competitor_topics_pool): topics that top similar repos use.
   Prioritize these — they are proven to attract the right audience.
2. Stack-derived: topics based on AUD-A detected stack (e.g. "nodejs", "typescript", "python").
3. Category-signal: broad discovery topics (e.g. "cli", "developer-tools", "open-source", "github").

Build a list of 20 topics total:
- Start with all current topics (no duplicates)
- Fill from competitor topics first (remove any that already exist)
- Then add stack topics
- Then add category-signal topics
- Never exceed 20

Show the user:
  Current topics (N): [list]
  From competitors: [list — label source: COMPETITOR_NAME]
  From stack: [list]
  From category: [list]
  Total adding: [20-N]

Apply using gh_safe:
gh_safe repos/REPO_OWNER/REPO_NAME/topics --method PUT \
  --field names[]="topic1" --field names[]="topic2" ... [all 20]

Verify:
gh api repos/REPO_OWNER/REPO_NAME/topics --jq '.names | length'

Report: "Topics: N → 20 (N from competitors, N from stack, N from category)"
```

---

#### Agent FIX-DESC — Description Upgrade

```
You are improving the repo description for: REPO_OWNER/REPO_NAME
Current description: [from AUD-B]
Current score: [from AUD-B — does it have a number? is it under 80 chars?]

Read the README value prop and Agent A/AUD-A intelligence to understand the project.

Generate 5 scored description candidates (≤100 chars each).
Score: has_number (2pts), action_verb_first (2pts), benefit_clear (2pts),
       under_80_chars (2pts), no_jargon (2pts). Max 10.

Show the scored table. Auto-select the top scorer. Let the user pick.

Apply:
gh_safe repos/REPO_OWNER/REPO_NAME --method PATCH --field description="CHOSEN_DESC"

Verify:
gh api repos/REPO_OWNER/REPO_NAME --jq '.description'
```

---

#### Agent FIX-FILES — Missing Standard Files

```
You are adding missing standard files to: REPO_OWNER/REPO_NAME
Missing files: [list from AUD-A missing_standard_files]
Stack: [from AUD-A stack]
Category: [detected from stack]
Date: TODAY

For each missing file, write it to LOCAL_DIR (or use gh api to create it if no local dir):

Files to potentially write (only write if missing):
- SECURITY.md → use the template from Synthesis step (category-aware scope section)
- .github/FUNDING.yml → github: [REPO_OWNER]
- CONTRIBUTING.md → use category-appropriate template
- .github/ISSUE_TEMPLATE/feature-request.yml → standard template
- .github/ISSUE_TEMPLATE/bug-report.yml → standard template
- .github/PULL_REQUEST_TEMPLATE.md → category-appropriate checklist
- .github/workflows/validate.yml → standard CI checks

For each file: confirm "Writing FILENAME..." before writing.
Do NOT write files that already exist — check AUD-A existing_files first.

After writing all files, commit:
git -C LOCAL_DIR add <specific new files only>
git -C LOCAL_DIR commit -m "Add missing GitHub standard files"
git -C LOCAL_DIR push

Report: "Written: [list]. Skipped (already existed): [list]."
```

---

#### Agent FIX-LABELS — Standard Label Creation

```
Repo: REPO_OWNER/REPO_NAME
Missing labels: [from AUD-B missing_standard_labels]

Only create labels that don't already exist.
Use gh_safe for each:

gh_safe repos/REPO_OWNER/REPO_NAME/labels --method POST --field name="good first issue" --field color="7057ff" --field description="Good for newcomers" 2>/dev/null || true
gh_safe repos/REPO_OWNER/REPO_NAME/labels --method POST --field name="documentation"   --field color="0075ca" --field description="Improvements to docs" 2>/dev/null || true
gh_safe repos/REPO_OWNER/REPO_NAME/labels --method POST --field name="enhancement"      --field color="a2eeef" --field description="New feature" 2>/dev/null || true
gh_safe repos/REPO_OWNER/REPO_NAME/labels --method POST --field name="bug"              --field color="d73a4a" --field description="Something isn't working" 2>/dev/null || true
gh_safe repos/REPO_OWNER/REPO_NAME/labels --method POST --field name="question"         --field color="d876e3" --field description="Further information needed" 2>/dev/null || true

Report: "Labels created: N. Already existed: N."
```

---

#### Agent FIX-ISSUE — Good First Issue

```
Repo: REPO_OWNER/REPO_NAME
Stack: [from AUD-A stack]
Existing good-first-issue: [from AUD-B has_good_first_issue]

Only run if AUD-B has_good_first_issue = false.

Step 1: Read actual repo history to derive a genuine issue:
# Recent commits — what has been added/changed lately?
gh api repos/REPO_OWNER/REPO_NAME/commits?per_page=20 \
  --jq '[.[] | {sha: .sha[0:7], message: .commit.message | split("\n")[0]}]'

# Merged PRs — what patterns of contribution have already landed?
gh api repos/REPO_OWNER/REPO_NAME/pulls?state=closed\&per_page=20 \
  --jq '[.[] | select(.merged_at != null) | {title: .title, labels: [.labels[].name]}]' 2>/dev/null

# Open issues — what's already filed? Don't duplicate.
gh issue list --repo REPO_OWNER/REPO_NAME --state open --limit 10 --json title

# Read README to understand what documentation gaps exist:
gh api repos/REPO_OWNER/REPO_NAME/contents/README.md --jq '.content' | base64 -d | head -80

Step 2: From the commit history and README, derive one genuine good-first-issue.
Choose from these categories based on what's actually missing or could use improvement:
- Documentation: a README section that is thin, missing, or unclear
- Test coverage: a function with no test (check if test files exist in the tree)
- Example: a missing usage example for a feature mentioned in commits
- Typo/copy: find an actual existing typo or unclear phrasing in docs
- CI: if no CI workflow exists, suggest adding one

Do NOT invent tasks that aren't real for this repo.
Do NOT create a generic "add tests" issue — be specific to an actual file or function.

Verify labels exist before creating:
gh label list --repo REPO_OWNER/REPO_NAME --json name | jq '.[].name'
# If "good first issue" label is missing, create it first (use FIX-LABELS or inline):
gh_safe repos/REPO_OWNER/REPO_NAME/labels --method POST \
  --field name="good first issue" --field color="7057ff" \
  --field description="Good for newcomers" 2>/dev/null || true

gh issue create \
  --repo REPO_OWNER/REPO_NAME \
  --title "<specific title derived from actual repo content>" \
  --body "## Context
<one paragraph explaining what this is and why it matters, derived from actual code/docs>

## What to do
<numbered steps, specific to this repo's files and structure>

## Files to look at
- <actual file path from the tree>

## Success criteria
<exactly what done looks like — testable>

## Skill level
Perfect for someone new to this codebase. No prior context required." \
  --label "good first issue" \
  --label "documentation"

Report: "Issue #N created: [title]"
```

---

#### Agent FIX-RELEASE — Version-aware Release

```
Repo: REPO_OWNER/REPO_NAME
Existing releases: [from AUD-B]
.skill file: [from user if provided, or "none"]

Detect current version:
LATEST=$(gh release list --repo REPO_OWNER/REPO_NAME --limit 1 --json tagName --jq '.[0].tagName' 2>/dev/null)
GIT_LATEST=$(git -C LOCAL_DIR tag --sort=-v:refname 2>/dev/null | head -1)
CURRENT="${LATEST:-${GIT_LATEST:-none}}"
echo "Current version: $CURRENT"

If no releases exist → create v1.0.0
If releases exist → parse CURRENT, offer:
  Patch: v1.0.1 (bug fixes)
  Minor: v1.1.0 (new features, backward compatible)
  Major: v2.0.0 (breaking changes)

Ask the user which to use. Default: patch.

Create release with appropriate version:
gh release create <CHOSEN_VERSION> \
  $([ "SKILL_PATH" != "none" ] && echo "SKILL_PATH") \
  --repo REPO_OWNER/REPO_NAME \
  --title "<CHOSEN_VERSION> — <brief description of what changed>" \
  --notes "## What's in <CHOSEN_VERSION>

Released: TODAY

### Changed
[Summarize actual changes from recent git log or README]

### Install
\`\`\`
INSTALL_CMD
\`\`\`"

Report: "Release <CHOSEN_VERSION> created."
```

---

#### Agent FIX-CONSISTENCY — Version Mismatch Repair (NEW)

```
You are fixing version mismatches across all version sources.
Repo: REPO_OWNER/REPO_NAME
Local dir (if available): LOCAL_DIR
Version mismatches: [from AUD-F version_mismatches]
Canonical version recommendation: [from AUD-F canonical_version_recommendation]

Only run if AUD-F version_mismatch_count > 0.

Step 1: Show the user what's mismatched:

--- VERSION AUDIT ---
package.json:        [AUD-F value or "not present"]
pyproject.toml:      [AUD-F value or "not present"]
go.mod:              [AUD-F value or "not present"]
Cargo.toml:          [AUD-F value or "not present"]
Latest git tag:      [AUD-F value or "none"]
Latest GitHub release: [AUD-F value or "none"]
README install cmd:  [AUD-F value or "none found"]

Mismatches found: N
Proposed canonical: CANONICAL_VERSION
---

Ask: "Update all sources to CANONICAL_VERSION? Or say your preferred version."
Wait for response. Store as CHOSEN_VERSION.

Step 2: Apply fixes for each source that needs updating:

For package.json (if LOCAL_DIR available):
# Use jq to update in-place, not sed
jq ".version = \"CHOSEN_VERSION\"" LOCAL_DIR/package.json > LOCAL_DIR/package.json.tmp \
  && mv LOCAL_DIR/package.json.tmp LOCAL_DIR/package.json
echo "Updated package.json"

For pyproject.toml (if LOCAL_DIR available):
# Use sed only for the version line — targeted, not destructive
sed -i.bak "s/^version = \".*\"/version = \"CHOSEN_VERSION\"/" LOCAL_DIR/pyproject.toml
rm LOCAL_DIR/pyproject.toml.bak
echo "Updated pyproject.toml"

For README install command version references:
# Show the specific lines that contain the old version
grep -n "WRONG_VERSION" LOCAL_DIR/README.md
# Update only those lines
sed -i.bak "s/WRONG_VERSION/CHOSEN_VERSION/g" LOCAL_DIR/README.md
rm LOCAL_DIR/README.md.bak
echo "Updated README.md install command version"

For git tag (only if CHOSEN_VERSION is newer than latest tag):
git -C LOCAL_DIR tag CHOSEN_VERSION 2>/dev/null || echo "Tag already exists — skipping"

Commit the file changes:
git -C LOCAL_DIR add package.json pyproject.toml README.md 2>/dev/null
git -C LOCAL_DIR commit -m "chore: align version to CHOSEN_VERSION across all sources"
git -C LOCAL_DIR push

Report: "Version aligned to CHOSEN_VERSION across: [list of files updated]. Skipped: [list]."
```

---

#### Agent FIX-SETTINGS — Repo Settings Optimization (NEW)

```
You are optimizing repository settings for: REPO_OWNER/REPO_NAME
Settings from AUD-B: branch_protection=B, delete_branch_on_merge=D, squash_merge=S, dependabot=E

Only update settings that are NOT already optimal.

Step 1: Show current state and proposed changes:

--- SETTINGS AUDIT ---
Delete branch on merge:    [current] → enable (reduces branch clutter)
Squash merge:              [current] → enable (cleaner commit history)
Branch protection (main):  [current] → [action needed or "already protected"]
Dependabot alerts:         [current] → enable (free security scanning)
---

Ask: "Apply these settings optimizations? (recommended)"
Wait for confirmation.

Step 2: Apply confirmed changes:

Enable delete branch on merge + squash merge:
gh_safe repos/REPO_OWNER/REPO_NAME --method PATCH \
  --field delete_branch_on_merge=true \
  --field allow_squash_merge=true

Enable Dependabot vulnerability alerts:
gh_safe repos/REPO_OWNER/REPO_NAME/vulnerability-alerts --method PUT 2>/dev/null || true

Enable Dependabot auto security updates (if alerts enabled):
gh_safe repos/REPO_OWNER/REPO_NAME/automated-security-fixes --method PUT 2>/dev/null || true

For branch protection — only if not already set:
DEFAULT_BRANCH=$(gh api repos/REPO_OWNER/REPO_NAME --jq '.default_branch')
gh_safe repos/REPO_OWNER/REPO_NAME/branches/$DEFAULT_BRANCH/protection \
  --method PUT \
  --field required_status_checks=null \
  --field enforce_admins=false \
  --field required_pull_request_reviews=null \
  --field restrictions=null 2>/dev/null || echo "Branch protection: skipped (may require admin access)"

Verify:
gh api repos/REPO_OWNER/REPO_NAME --jq '{delete_branch_on_merge: .delete_branch_on_merge, allow_squash_merge: .allow_squash_merge}'

Report: "Settings updated: [list what changed]. Skipped: [list why]."
```

---

#### Agent FIX-CHANGELOG — Append New Version Block (NEW)

```
You are updating the CHANGELOG for: REPO_OWNER/REPO_NAME
Local dir (if available): LOCAL_DIR
Stale verdict: [from AUD-F stale_files — includes CHANGELOG status]

NEVER overwrite or replace an existing CHANGELOG — only APPEND a new version block.

Step 1: Read the existing CHANGELOG to understand its format:
CHANGELOG=$(gh api repos/REPO_OWNER/REPO_NAME/contents/CHANGELOG.md --jq '.content' 2>/dev/null | base64 -d)
If no CHANGELOG exists: create a new file with the standard header + first version block.

Detect the CHANGELOG format from the existing content:
- Does it use ## [version] — date format? (Keep Changelog style)
- Does it use ## version — date format? (simpler)
- Does it use ### Added / Changed / Fixed subsections?
Match the detected format exactly for the new block.

LAST_ENTRY_VERSION=$(parse the most recent version number from CHANGELOG header)

Step 2: Read git history since the last CHANGELOG entry:
# Get commits since last tag/entry:
LAST_TAG=$(gh api repos/REPO_OWNER/REPO_NAME/tags --jq '.[0].name' 2>/dev/null || echo "")
if [ -n "$LAST_TAG" ]; then
  git -C LOCAL_DIR log $LAST_TAG..HEAD --oneline --no-merges 2>/dev/null | head -20
else
  git -C LOCAL_DIR log --oneline --no-merges -20 2>/dev/null | head -20
fi

# Get merged PRs since last CHANGELOG entry:
gh api repos/REPO_OWNER/REPO_NAME/pulls?state=closed\&per_page=20 \
  --jq '[.[] | select(.merged_at != null) | {title: .title, number: .number, merged_at: .merged_at}]' 2>/dev/null

Step 3: Draft the new version block matching existing format:
New version = CANONICAL_VERSION from AUD-F (or v1.0.0 if no versions exist)
Date = TODAY

Categorize commits/PRs into:
- Added: new features (feat:, add , new )
- Changed: modifications (update , change , refactor )
- Fixed: bug fixes (fix:, bugfix , closes #)
- Removed: deletions (remove , delete , drop )
Only include categories that have at least one item.

Show the user:
--- NEW CHANGELOG BLOCK (will be PREPENDED after the ## [Unreleased] line or at the top) ---
[full new version block in detected format]
---

Ask: "Add this block to CHANGELOG.md?"
Wait for confirmation.

Step 4: Prepend the new block immediately after the first line / ## [Unreleased] section:
# Write to disk (LOCAL_DIR) or create via gh api if no LOCAL_DIR:
if [ -n "$LOCAL_DIR" ]; then
  # Insert the new block after line 1 (or after [Unreleased] section if present)
  NEW_BLOCK="[confirmed new block content]"
  # Use awk to insert after the header line
  awk "NR==1{print; print NEW_BLOCK; next}1" LOCAL_DIR/CHANGELOG.md > LOCAL_DIR/CHANGELOG.md.tmp
  mv LOCAL_DIR/CHANGELOG.md.tmp LOCAL_DIR/CHANGELOG.md
  git -C LOCAL_DIR add CHANGELOG.md
  git -C LOCAL_DIR commit -m "docs: add CHOSEN_VERSION changelog entry"
  git -C LOCAL_DIR push
else
  # No local dir — update via GitHub API
  CONTENT=$(printf '%s' "$EXISTING_CHANGELOG_WITH_NEW_BLOCK" | base64)
  gh api repos/REPO_OWNER/REPO_NAME/contents/CHANGELOG.md --method PUT \
    --field message="docs: add CHOSEN_VERSION changelog entry" \
    --field content="$CONTENT" \
    --field sha="$(gh api repos/REPO_OWNER/REPO_NAME/contents/CHANGELOG.md --jq '.sha')"
fi

Report: "CHANGELOG updated — appended CHOSEN_VERSION block with N entries."
```

---

### IMPROVE STEP 5 — Validation

```bash
gh repo view REPO_OWNER/REPO_NAME \
  --json name,description,topics,homepageUrl,hasDiscussionsEnabled,hasIssuesEnabled

TOPIC_COUNT=$(gh api repos/REPO_OWNER/REPO_NAME/topics --jq '.names | length')
echo "Topics: $TOPIC_COUNT"

gh label list --repo REPO_OWNER/REPO_NAME --json name

gh release list --repo REPO_OWNER/REPO_NAME --limit 3 --json tagName,name

# Re-check CI status after any workflow changes:
gh api repos/REPO_OWNER/REPO_NAME/actions/runs?per_page=1 \
  --jq '.workflow_runs[0] | {status: .status, conclusion: .conclusion}' 2>/dev/null || true

# Re-check version consistency:
gh api repos/REPO_OWNER/REPO_NAME/tags --jq '.[0].name' 2>/dev/null
gh api repos/REPO_OWNER/REPO_NAME/releases/latest --jq '.tag_name' 2>/dev/null || true
```

For each item in CONFIRMED_GAPS, verify the fix landed:
- Topic gap → topics count now ≥ 15? ✓/✗
- Description gap → new description set? ✓/✗
- Label gap → all 5 standard labels present? ✓/✗
- README gap → score improved (re-evaluate AUD-C dimensions on new README)? ✓/✗
- Pages gap → Pages status = "built"? ✓/✗
- Release gap → new release present? ✓/✗
- Version consistency gap → all sources now agree? ✓/✗
- CHANGELOG gap → new version block prepended? ✓/✗
- Settings gap → delete_branch_on_merge and squash_merge enabled? ✓/✗
- Broken links → re-check the previously broken URLs? ✓/✗

Recompute Health Score:
Run same formula as STEP 3. Compare: BEFORE_SCORE/100 → AFTER_SCORE/100.

Report each as ✓ FIXED or ✗ STILL FAILING with the repair command.

Write final checkpoint:
```bash
echo "improve_done:$(date -u +%Y-%m-%dT%H:%M:%SZ)" >> <local-dir>/.launch-state
```

---

### IMPROVE FINAL REPORT

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔧  IMPROVE COMPLETE — REPO_OWNER/REPO_NAME
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Health Score:   BEFORE_SCORE/100 → AFTER_SCORE/100  (+DELTA)

✓ README:         N/18 → M/18  [N fixes applied, tone: DETECTED_TONE]
✓ Topics:         X → 20  (N from competitors, N from stack)
✓ Description:    [new description]
✓ Labels:         N created
✓ Issue:          [title or "already existed"]
✓ Release:        [version]
✓ Pages:          [live / already existed / skipped]
✓ Files added:    [list]
✓ SVG:            [regenerated / already good / skipped]
✓ Version sync:   [aligned to CHOSEN_VERSION / "already consistent"]
✓ CHANGELOG:      [new block added / "already current"]
✓ Settings:       [changes applied / "already optimal"]
✓ Broken links:   [N fixed / "none found"]

Gaps fixed:   N / N confirmed
Still open:   [anything that failed validation + specific fix command]

GROWTH CONTEXT (from AUD-D):
  Stars: N (VELOCITY/wk) — GROWTH_DIAGNOSIS
  [reach problem]: Fix discoverability before distribution. Topics + description are now done.
  [resonance problem]: README improved. Monitor star rate over next 7 days.
  [healthy]: Keep the distribution cadence going.

NEXT STEPS:
  If stars < 5:  Post LinkedIn + Reddit now (untapped: UNTAPPED_CHANNELS)
  If stars 5–10: Submit Product Hunt
  If stars ≥ 10: Post Show HN
  Skip channels already tried: PREVIOUSLY_TRIED_CHANNELS
  Distribution calendar: [paste relevant days from 7-day calendar if Phase 3 was run]

TOP COMPETITOR LESSON: BENCHMARK_SUMMARY (from AUD-E)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## WHAT NOT TO DO (IMPROVE MODE additions)

- **Never replace a README wholesale in improve mode** — always show section-by-section diffs, apply only confirmed fixes
- **Never create a v1.0.0 release on a repo that already has v2.x** — always detect the current version tag first
- **Never add topics that already exist** — use PUT with the full deduplicated list, not repeated --add-topic
- **Never skip the gap confirmation step** — the user must approve the punch list before any writes happen
- **Never run all Phase 3 distribution agents unless user confirms** — distribution in improve mode is opt-in
- **Never overwrite CHANGELOG.md** — it has history; always prepend a new version block and never touch existing entries
- **Never recommend distribution channels the user has already tried** — check AUD-B previously_tried_channels and exclude them
- **Never write tone-mismatched README fixes** — use AUD-C detected_tone and match it in every proposed change
- **Never apply FIX-CONSISTENCY without showing the full version audit table first** — the user must see all mismatches before any file is touched
- **Never enable branch protection if the repo only has one contributor** — check fork/contributor count first; protection can block solo developers
- **Never run FIX-CHANGELOG without reading the existing file's format** — match the detected format exactly, never introduce a new style
- **Never skip the broken link check re-verification** — confirm fixed links return 200 before reporting success
- **Never report AUD-E competitor analysis without checking if the competitor repos are actually similar** — verify topic overlap, not just name similarity

---

## WHAT NOT TO DO

- **Never use `gh api` for mutations without `gh_safe`** — concurrent PATCH/POST/GraphQL calls will hit GitHub secondary rate limits silently; use the wrapper for all write operations
- **Never delete `.launch-state` mid-run** — it's the resume anchor; only delete it intentionally to start fresh
- **Never run parallel phase agents sequentially** — kills the time benefit
- **Never skip name scoring** — even with a preferred name, scoring may surface better
- **Never skip Agent B in full mode** — competitor research directly shapes README quality
- **Never omit the SVG `<img>` from README** — must be the first element in the header div
- **Never use github-launch-agent content in the SVG or CHANGELOG** — Agent C and D must derive from the TARGET project, not from this skill
- **Never set `--homepage` to the repo URL itself** — only to Pages URL or custom domain
- **Never overwrite an existing SKILL.md** — check first
- **Never stage `.env` or secret files** — stop and warn
- **Never create the issue before creating the labels** — GitHub rejects unknown labels
- **Never use a generic good-first-issue** — tailor to the actual project category
- **Never leave placeholder text in SVG, docs/index.html, CHANGELOG, or CONTRIBUTING** — fill every field
- **Never use relative dates in the 7-day calendar** — compute absolute dates from TODAY
- **Never skip validation** — report success only after all 7 checks pass
- **Never post to Product Hunt before 5 stars** — zero-star launch is invisible
- **Never submit identical copy to all 3 newsletters** — each has a distinct voice
- **Never post the DEV.to article before the repo is live** — links must resolve
- **Never write package-skill.yml for non-claude-skill projects** — it only makes sense for skills
- **Never hardcode dates** — always derive from TODAY variable set at Step 0
