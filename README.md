# CrankReview

CrankReview is a macOS-native automation pipeline designed to support a deep-thinking research workflow. It automatically fetches a week’s worth of digital output from a personal JSON feed, filters it for recency, and uses the Gemini 1.5 Pro model to synthesize the data into a structured research note within an Obsidian vault.

## Motivation
I built CrankReview because I wanted an AI that didn't just "chat" but "observed" my thinking over time. While I share thoughts and links frequently via my microblog, those fragments often disappear into the feed. 

The goal was to create a system that acts as a "Cultural Anthropologist"—stepping back to see connections across bigger ideas and domain areas. This project allowed me to explore the power of the local Gemini CLI and move toward a future where AI isn't a destination you visit, but a background utility that observes and assists within your existing file system.

## What it Does
* **Automated Ingestion:** Periodically fetches your latest personal feed data without manual intervention.
* **Temporal Filtering:** Isolates the "signal" by focusing only on the last 7 days of activity.
* **Anthropological Synthesis:** Uses a specialized system persona to identify philosophical patterns and deep-tech shifts across disparate posts.
* **Obsidian Integration:** Delivers the final analysis as a dated Markdown file directly into a local knowledge vault.
* **macOS Native:** Runs as a background service via `launchd`, requiring no open windows or active browser sessions.

## Technical Details
The system is built as a three-stage shell pipeline using `curl`, `jq`, and the Gemini CLI. It is designed to be resilient to "Escape Character Hell" by using a semantic bridge strategy. For detailed setup instructions, environment configuration, and pathing requirements, see [DOCUMENTATION.md](DOCUMENTATION.md).

## The Process
CrankReview was built through Vibe Coding with Gemini and inspired by the philosophy of working with the garage door open. For a narrative on the friction of the build, the shift from cloud-based AI to local CLI, and observations from the AI coding partner, see [PROCESS.md](PROCESS.md).