#!/bin/bash

# 1. Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"

# 2. Ensure environment variables are loaded
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found in $SCRIPT_DIR"
    exit 1
fi

source .env

# 3. Ensure necessary directories exist
mkdir -p ../data
mkdir -p ../logs

# 4. Run the 3-stage pipeline
echo "--- Starting Weekly Review $(date) ---" >> ../logs/automation.log

./01_fetch.sh >> ../logs/automation.log 2>&1
./02_filter.sh >> ../logs/automation.log 2>&1
./03_review.sh >> ../logs/automation.log 2>&1

echo "✅ Pipeline completed at $(date)" >> ../logs/automation.log