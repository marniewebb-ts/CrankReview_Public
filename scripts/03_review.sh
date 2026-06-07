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
I am providing you with a Markdown file containing my commentary and the URLs I shared over the last 7 days.

TASK:
1. **The Deep Synthesis**: Connect the dots. Use the provided URLs to infer the broader themes I am tracking. 
   - **CITATIONS**: You MUST include inline citations linking back to my original posts. For example: '...as noted in [this post](URL)...'.
   - **OUTLIERS**: Do not force a single cohesive narrative if one doesn't exist. It is okay if some posts are outliers; identify them as 'Interesting Anomalies' or 'Edge Cases' if they don't fit the main themes.
2. **Philosophical Patterns**: Identify 3 shifts in the 'Social Tech' landscape based on these posts. Use terms like 'legibility', 'folkways', 'protocol vs platform', and 'technical agency'.
3. **The 'Unasked' Question**: Provide 3 provocations that aren't obvious. What is the question I am ALMOST asking in these posts but haven't quite articulated yet?

STYLE:
- Intellectual, DIY-geeky, and deeply curious.
- Do not write a LinkedIn post. Provide the 'Sense-Making' I need to write one myself.

DATA:
$(cat $INPUT_FILE)"

# Execute Gemini CLI using the API Key defined in .env
# Ensure 'gemini' CLI is in your $PATH
{
echo "---"
echo "type: synthesis"
echo "source: crank-review-public"
echo "date: $DATE_STAMP"
echo "tags: [synthesis/crank]"
echo "---"
echo ""
gemini --prompt "$PROMPT"
} > "$OUTPUT_FILE"

echo "✅ Review complete! Saved to $OUTPUT_FILE"