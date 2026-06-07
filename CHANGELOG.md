# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.2.0] - 2026-06-07

### Added
- **Inline Citations:** The review prompt now mandates inline citations linking back to original `Crank.report` posts.
- **Outlier Handling:** The synthesis prompt now explicitly allows the identification of "Interesting Anomalies" and "Edge Cases" instead of forcing a singular narrative.
- **Standardized YAML:** Synthesis output now includes consistent YAML frontmatter for improved metadata management in Obsidian.

### Fixed
- **Executable Pathing:** Explicitly defined the gemini executable path to ensure robust script execution across environments.

## [1.1.0] - 2026-05-29

### Added
- Initial automated pipeline stages (fetch, filter, review).
- Cultural Anthropologist persona for synthesis.

## [1.0.0] - 2026-04-10

### Added
- Initial project scaffolding and proof-of-concept scripts.
