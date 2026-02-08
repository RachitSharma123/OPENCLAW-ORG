#!/usr/bin/env bash
set -euo pipefail

DB="${LC_DB:-$HOME/.life-control/life.db}"
CHAT_ID="${TELEGRAM_CHAT_ID:-}"

if [[ -z "$CHAT_ID" ]]; then
  echo "TELEGRAM_CHAT_ID is not set." >&2
  exit 1
fi

if [[ ! -f "$DB" ]]; then
  echo "Database not found. Run: lc init" >&2
  exit 1
fi

map_priority() {
  case "$1" in
    high) echo 0 ;;
    normal) echo 1 ;;
    low) echo 2 ;;
    *) echo 1 ;;
  esac
}

rows=$(sqlite3 -batch -noheader "$DB" "SELECT id, agent, telegram_token, message, priority FROM notifications WHERE sent=0 ORDER BY CASE priority WHEN 'high' THEN 0 WHEN 'normal' THEN 1 ELSE 2 END, id ASC LIMIT 20;")

if [[ -z "$rows" ]]; then
  exit 0
fi

while IFS='|' read -r id agent token message priority; do
  if [[ -z "$token" ]]; then
    sqlite3 "$DB" "UPDATE notifications SET sent=1, sent_at=datetime('now') WHERE id=$id;"
    continue
  fi

  curl -s -X POST "https://api.telegram.org/bot${token}/sendMessage" \
    -d "chat_id=${CHAT_ID}" \
    --data-urlencode "text=${agent}: ${message}" \
    >/dev/null
  sqlite3 "$DB" "UPDATE notifications SET sent=1, sent_at=datetime('now') WHERE id=$id;"
  sqlite3 "$DB" "INSERT INTO activity(agent, action, target, details) VALUES('$agent', 'sent', 'telegram', '$priority');"
done <<< "$rows"
