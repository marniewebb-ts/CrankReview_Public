#!/bin/bash
# Load environment variables
source .env

mkdir -p ../data
echo "🔄 Fetching feed from $FEED_URL..."
curl -s "$FEED_URL" > ../data/feed.json
echo "✅ Fetch complete."