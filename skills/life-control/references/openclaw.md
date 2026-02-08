# OpenClaw Integration Notes

Use this reference when the user wants the Life Control system to run via OpenClaw skills.

## Quick bootstrap
- Ensure the repo root is available.
- Set bot tokens + chat ID as environment variables.
- Run: `skills/life-control/scripts/bootstrap.sh`.

## Persona mapping
- wellness-coach → nutrition/fitness tracking
- money-mentor → finance tracking
- style-guru → fashion/wardrobe
- career-catalyst → career and skills
- vision-keeper → life goals and planning
- heart-connector → relationships and social radar
- soul-guide → spiritual happiness
- creative-spark → creativity and hobbies

## Expected agent behaviors
- Use `lc add`, `lc log`, `lc msg`, `lc notify` to maintain clean coordination.
- Use routines in `routines/` for daily alignment prompts.
