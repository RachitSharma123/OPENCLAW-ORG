# Life Control 💖

Your warm, high-IQ personal coordination system. Track nutrition, finance, career, relationships, spiritual growth, and more — all from a simple CLI with SQLite + cron + Telegram bots.

## ✨ Step-by-step setup

### 1) Install
```bash
git clone https://github.com/RachitSharma123/OPENCLAW-ORG | echo "life-control"
cd life-control
chmod +x lc qlog setup-agents.sh telegram-sender.sh install.sh routines/*.sh
```

### 2) Initialize the database
```bash
./lc init
```

### 3) Create Telegram bots (one per agent)
1. Open Telegram and message **@BotFather**.
2. Create a bot for each agent (wellness, finance, fashion, etc.).
3. Save each bot token.
4. Get your chat ID from **@userinfobot**.

Export your chat ID (used by `telegram-sender.sh`):
```bash
export TELEGRAM_CHAT_ID="YOUR_CHAT_ID"
```

### 4) Register your agents
Edit `setup-agents.sh` and paste the bot tokens. Then run:
```bash
./setup-agents.sh
```

### 5) Add the cron routines
Copy `crontab-template.txt` into your crontab and update paths:
```bash
crontab -e
```

### 6) Run your dashboard
```bash
lc dashboard
```

---

## 🤖 Your life agents
Each agent has its own Telegram bot for focused updates.

| Agent | Focus | Telegram bot |
|------|-------|---------------|
| wellness-coach | protein, food, exercise, body metrics | Wellness bot |
| money-mentor | budget, investments, expenses | Finance bot |
| style-guru | wardrobe, outfits, shopping | Fashion bot |
| career-catalyst | skills, networking, career growth | Career bot |
| vision-keeper | long-term goals, milestones | Life goals bot |
| heart-connector | partner, social radar | Relationship bot |
| soul-guide | meditation, gratitude | Spiritual bot |
| creative-spark | hobbies, creativity | Creative bot |

---

## ⏰ Daily routines (cron-powered)
These match your request for warm, structured life checks:

- **Morning Alignment** (7:00 AM)
- **High-Signal Intelligence** (7:30 AM, M/W/F)
- **Work Outcome Priming** (8:30 AM, weekdays)
- **Body Protocol Check** (12:00 PM)
- **Financial Stability Pulse** (1:00 PM, Mon/Thu)
- **Partner/Social Radar** (6:00 PM)
- **System Shutdown & Log** (9:00 PM)

Scripts live in `routines/` and send messages via the relevant agent bots.

---

## 💫 Core commands
```bash
lc init
lc register <name> [role] [focus] [telegram_token]
lc add "Title" [category] [agent] [priority] [due_date]
lc list [status] [category]
lc start <id>
lc done <id> [message]
lc log <category> <metric> <value> [unit] [notes]
lc msg <agent> "body" [subject] [task_id]
lc inbox [all]
lc fleet
lc feed [limit]
lc notify <agent> "message" [priority]
lc checkin [status]
lc dashboard
```

---

## 🌟 Quick logging (qlog)
Shortcuts for daily metrics.
```bash
qlog protein 50 "breakfast shake"
qlog water 2
qlog workout 45 "strength training"
qlog meditate 10 "breathwork"
qlog expense 25 "lunch"
```

---

## 📬 Telegram sender
Run every 15 minutes via cron to send queued messages:
```bash
./telegram-sender.sh
```

---

## 🧭 Architecture
See [`ARCHITECTURE.md`](ARCHITECTURE.md) for the full system diagram and data flow.

---

## 📖 Examples
More usage scenarios are in [`EXAMPLES.md`](EXAMPLES.md).

---

## 💞 Tone & personality
This system is intentionally warm, fluffy, and smart. You’ll get kind reminders, crisp priorities, and supportive nudges without noise.

If you want different message styles or additional routines, edit the scripts in `routines/`.
