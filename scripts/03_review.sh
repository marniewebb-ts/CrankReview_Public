#!/bin/bash
# Load environment variables
source .env

INPUT_FILE="../data/week_raw.md"
DATE_STAMP=$(date +%Y-%m-%d)
OUTPUT_FILE="$VAULT_DIR/${DATE_STAMP}_CrankReview.md"

mkdir -p "$VAULT_DIR"

echo "🧠 Running Gemini Analysis via Cultural Anthropologist Persona..."

# The system prompt - users can tweak this in their own fork
PROMPT="You are a Cultural Anthropologist specializing in Technology and Civil Society. 
Analyze the following posts and links from the last 7 days. 
Connect the dots between the themes and provide 3 deep provocations for the user.

DATA:
$(cat $INPUT_FILE)"

# Execute Gemini CLI using the API Key defined in .env
# Note: Ensure 'gemini' CLI is in your PATH
gemini --prompt "$PROMPT" > "$OUTPUT_FILE"

echo "✅ Review complete! Saved to $OUTPUT_FILE"