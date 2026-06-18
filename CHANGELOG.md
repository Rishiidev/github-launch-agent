# Changelog

All notable changes documented here.
Format: [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

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
