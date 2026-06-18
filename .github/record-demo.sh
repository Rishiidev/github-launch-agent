#!/usr/bin/env bash
# record-demo.sh — 30-second terminal demo storyboard for github-launch-agent
#
# Tool: asciinema (recommended) or ttyrec / Terminalizer
# Install: brew install asciinema agg
#
# Record:
#   asciinema rec demo.cast --cols 100 --rows 32 --idle-time-limit 2
# Convert to GIF:
#   agg demo.cast assets/demo.gif --cols 100 --rows 32
# Convert to SVG (optional):
#   svg-term --cast demo.cast --out assets/demo.svg

# ── STORYBOARD ──────────────────────────────────────────────────────────────
#
# Scene 1 (0–5s): Trigger phrase
#   Prompt shows: $
#   Type slowly: agentic github launch
#   Pause 1s — Claude starts responding
#
# Scene 2 (5–14s): SEO name scoring table
#   Output: the 5-candidate table with scores
#   Cursor highlight on the "★ Recommended" row
#   Type: 2    (pick candidate #2)
#
# Scene 3 (14–24s): Phase 1 fires — 4 agents simultaneously
#   Show: "═══ PARALLEL PHASE 1 ═══"
#   Show: "Spawning Agent A (project intelligence)..."
#   Show: "Spawning Agent B (competitor research)..."
#   Show: "Spawning Agent C (social preview SVG)..."
#   Show: "Spawning Agent D (supporting files)..."
#   Brief pause — output trickles in from multiple agents
#   Show: "✓ SVG written to assets/social-preview.svg"
#   Show: "✓ Competitor patterns: headline has number, install early, CTA early"
#
# Scene 4 (24–28s): Final report header
#   Show: "✓ Repo:    https://github.com/Rishiidev/my-skill"
#   Show: "✓ Website: https://Rishiidev.github.io/my-skill"
#   Show: "✓ Topics:  20/20 set"
#   Show: "✓ Release: v1.0.0"
#   Show: "AGENTS SPAWNED: 16 (A–P)"
#
# Scene 5 (28–30s): Install command
#   Show: "/plugin install github:Rishiidev/my-skill"
#   Terminal fades / loop back
#
# ── RECORDING TIPS ──────────────────────────────────────────────────────────
#   Font: Fira Code or JetBrains Mono, size 16
#   Window: 100 cols × 32 rows
#   Theme: match #0d1117 background (GitHub dark)
#   Idle limit: 2s (--idle-time-limit 2) compresses thinking pauses
#   Speed up: agg --speed 1.5 for 20s total GIF

echo "Storyboard ready. To record:"
echo "  asciinema rec demo.cast --cols 100 --rows 32 --idle-time-limit 2"
echo "  agg demo.cast assets/demo.gif"
