#!/usr/bin/env bash
set -euo pipefail

GREEN="\033[92m"
YELLOW="\033[93m"
CYAN="\033[96m"
RESET="\033[0m"

INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${CYAN}✨ Welcome to Life Control Installation!${RESET}"

chmod +x "$INSTALL_DIR/lc"
chmod +x "$INSTALL_DIR/qlog"
chmod +x "$INSTALL_DIR/setup-agents.sh"
chmod +x "$INSTALL_DIR/telegram-sender.sh"
chmod +x "$INSTALL_DIR"/routines/*.sh

mkdir -p "$HOME/.life-control/backups"
mkdir -p "$HOME/.life-control/logs"

echo -e "${YELLOW}Adding Life Control to PATH...${RESET}"
if ! grep -q "life-control" "$HOME/.bashrc" 2>/dev/null; then
  {
    echo ""
    echo "# Life Control"
    echo "export PATH=\"\$PATH:$INSTALL_DIR\""
    echo "export LC_DB=\"\$HOME/.life-control/life.db\""
    echo "alias q='qlog'"
  } >> "$HOME/.bashrc"
  echo -e "${GREEN}✓ Added to ~/.bashrc${RESET}"
else
  echo -e "${GREEN}✓ Already configured in ~/.bashrc${RESET}"
fi

export PATH="$PATH:$INSTALL_DIR"
export LC_DB="$HOME/.life-control/life.db"

"$INSTALL_DIR/lc" init

echo -e "${CYAN}Telegram Setup${RESET}"
echo "Create bots with @BotFather and get your chat ID via @userinfobot."
read -r -p "Set TELEGRAM_CHAT_ID now? (y/n) " reply
if [[ "$reply" =~ ^[Yy]$ ]]; then
  read -r -p "Enter your Telegram Chat ID: " chat_id
  echo "export TELEGRAM_CHAT_ID=\"$chat_id\"" >> "$HOME/.bashrc"
  echo -e "${GREEN}✓ TELEGRAM_CHAT_ID saved${RESET}"
fi

echo -e "${CYAN}Agent Setup${RESET}"
read -r -p "Run agent setup now? (y/n) " agent_reply
if [[ "$agent_reply" =~ ^[Yy]$ ]]; then
  "$INSTALL_DIR/setup-agents.sh"
else
  echo -e "${YELLOW}You can run ./setup-agents.sh later.${RESET}"
fi

echo -e "${CYAN}Cron Setup${RESET}"
echo "Review crontab-template.txt for daily routines."

echo -e "${GREEN}✨ Installation Complete!${RESET}"
