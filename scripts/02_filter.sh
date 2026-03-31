#!/bin/bash
# Load environment variables
source .env

RAW_FEED="../data/feed.json"
FILTERED_DATA="../data/week_raw.md"
# BSD Date format for macOS
SEVEN_DAYS_AGO=$(date -v-7d +%Y-%m-%dT%H:%M:%SZ)

echo "📅 Filtering for posts since: $SEVEN_DAYS_AGO"

# Clear the old file
> $FILTERED_DATA

# Extract content safely to a flat file to avoid parse errors in loops
jq -r --arg date "$SEVEN_DAYS_AGO" '.items[] | select(.date_published >= $date) | "---", "CONTENT: " + .content_html, "URL: " + .url' $RAW_FEED > $FILTERED_DATA

echo "✅ Filtered data saved to $FILTERED_DATA"