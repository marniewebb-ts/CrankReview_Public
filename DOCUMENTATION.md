# 🛠 CrankReview Technical Documentation

This document explains the architecture and setup process for the CrankReview pipeline. 

> [!NOTE]
> This project was **Vibe Coded** using Gemini. This documentation was authored by Gemini with human review as part of an open-process development philosophy.

---

## 🏗 System Architecture

CrankReview is a three-stage automated pipeline built for macOS. It transforms a raw JSON feed into a synthesized research note using a Large Language Model (Gemini).

### Stage 1: Ingestion (`01_fetch.sh`)
Uses `curl` to retrieve the latest `feed.json` from your specified URL. This is the raw data source for all analysis.

### Stage 2: Transformation (`02_filter.sh`)
Uses `jq` to isolate posts from the last 7 days. To avoid "Escape Character Hell" with complex HTML/Markdown content, this script performs a **Safe Data Dump**. It extracts the raw content and URLs into a flat file, bypassing fragile loops that often break on special characters.

### Stage 3: Synthesis (`03_review.sh`)
Passes the safe data dump into the Gemini CLI. Because Gemini has a massive context window and internal knowledge of the web, it processes the raw HTML and URLs directly, performing "Deep Synthesis" without requiring manual scraping of every link.

---

## 🚀 Setup & Installation

### 1. Prerequisites
Ensure you have the following installed on your Mac:
* **Homebrew**: To manage packages.
* **jq**: `brew install jq`
* **Gemini CLI**: The `google-gemini` package installed via Homebrew.

### 2. Environment Configuration
* Rename `scripts/.env.example` to `scripts/.env`.
* Edit `.env` and provide your unique `FEED_URL`, `VAULT_DIR`, and `GEMINI_API_KEY`.
* **Important:** Do not commit your `.env` file to version control.

### 3. Permissions
Before running for the first time, allow the scripts to execute by running this in your terminal:
`chmod +x scripts/*.sh`

### 4. Automation with launchd
To run this automatically every Friday at 9:00 AM:
1. Open `templates/com.user.crankreview.plist`.
2. Replace `YOUR_USERNAME` and `PATH_TO_REPO` with your actual Mac paths.
3. Move the file to your LaunchAgents folder:
   `cp templates/com.user.crankreview.plist ~/Library/LaunchAgents/`
4. Register the task:
   `launchctl load ~/Library/LaunchAgents/com.user.crankreview.plist`

---

## 📂 The Output: Your CrankReview Note

Every Friday, a new Markdown file is generated inside your `VAULT_DIR`.

### File Naming Convention
`YYYY-MM-DD_CrankReview.md` (e.g., `2026-03-31_CrankReview.md`)

### What’s Inside?
The note is structured for deep reading in personal knowledge management tools like Obsidian and includes:
* **The Week in Synthesis**: A narrative connecting your week's posts.
* **Philosophical Patterns**: 3 identified deep-tech or cultural shifts.
* **The 'Unasked' Question**: 3 provocations meant to spark your next writing project.

---

## 📂 Directory Structure
* `/scripts`: The executable shell scripts.
* `/templates`: Configuration files for macOS automation.
* `/data`: (Local only) Stores the raw and filtered feed data.
* `/logs`: (Local only) Stores output from the automated runs.