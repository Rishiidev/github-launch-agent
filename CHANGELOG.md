# Changelog

All notable changes documented here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

## [2.0.0] — 2026-06-18

### Added
- **Improve Mode**: full pipeline for upgrading repos that already exist — never overwrites a file without showing a diff and getting confirmation
- **6 parallel audit agents** (AUD-A–F): file + README deep audit, GitHub metadata + star velocity, 15-dimension README scorer with tone detection, distribution + growth diagnosis, competitive benchmark, and version consistency + freshness audit
- **ROI gap scoring**: every gap scored Impact ÷ Effort × 10, sorted by ROI, Quick Wins flagged, with a Health Score projection (current/100 → projected/100)
- **3 new fix agents**: FIX-CONSISTENCY (version alignment across package.json/pyproject/go.mod/Cargo/tags/release/README), FIX-SETTINGS (branch protection, Dependabot, squash merge), FIX-CHANGELOG (append-only version block matching existing format)
- **Tone detection**: README fixes match the repo's detected voice (technical/tutorial/terse/marketing)
- **Competitor benchmark**: mines top 3 similar repos for patterns and topics the target is missing
- **16 launch agents** (up from 12): added LinkedIn post, Product Hunt draft, newsletter pitches (TLDR AI, The Rundown AI, Ben's Bites), and DEV.to article draft
- **Resume/checkpoint**: `.launch-state` file enables resuming after a mid-run failure
- **Rate-limit guard**: `gh_safe` wrapper retries on GitHub secondary rate limits
- **Lite mode**: skip competitor research and all Phase 3 distribution for a sub-2-minute push

### Changed
- README quality scoring expanded from 10 to 18 points across 15 dimensions
- Description trimmed to under 1024 characters for Claude skill-upload compatibility
- `.skill` package now ships `SKILL.md` at the archive root (was nested under `skill-pkg/`)

### Fixed
- Skill upload failure caused by nested `SKILL.md` path and over-length description

## [1.0.0] — 2026-06-18

### Added
- **Parallel Phase 1**: research, SVG generation, topic discovery, and supporting files run simultaneously (4 agents)
- **Parallel Phase 2**: post-push config (topics, discussions, labels, release) runs simultaneously (4 agents)
- **Parallel Phase 3**: distribution drafts (Reddit, X, HN, awesome-list) run simultaneously (4 agents)
- **SEO name scoring**: 5 candidates scored on saturation, keyword match, memorability, and category signal — presented before collecting any other input
- **Competitor README mining**: Agent B fetches top 3 similar repos' READMEs and extracts headline format, install placement, CTA position, and value prop style
- **Social preview auto-embedded**: SVG is the first element in the README header div — no manual upload step for the README
- **5 scored description candidates**: Agent B generates and scores 5 repo description options; top scorer used by default
- **GitHub Pages landing page**: `docs/index.html` auto-generated with click-to-copy install command, dark terminal theme, feature cards; Pages enabled via GitHub API
- **7-day timed distribution calendar**: absolute dates, platform-specific posting windows, conditional logic (HN only after 10 stars)
- **`parallel-agent` label**: custom label for tracking agent parallelism improvements
- Total estimated time: ~4–6 minutes vs ~15–20 minutes sequential
