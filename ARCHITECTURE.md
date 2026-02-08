# Life Control Architecture 🏗️

## System Overview
```
┌────────────────────────────────────────────────────────────┐
│                      LIFE CONTROL CLI                      │
│  lc dashboard | lc add | qlog protein 50 | lc inbox        │
└──────────────────────────────┬─────────────────────────────┘
                               │
                    ┌──────────┴──────────┐
                    │   lc (bash CLI)     │
                    └──────────┬──────────┘
                               │
      ┌────────────────────────┼────────────────────────┐
      │                        │                        │
      ▼                        ▼                        ▼
┌──────────────┐        ┌──────────────┐        ┌──────────────┐
│   SQLite DB  │        │  Routines    │        │ Telegram     │
│  life.db     │        │ (cron jobs)  │        │ Notifications│
└──────────────┘        └──────────────┘        └──────────────┘
```

## Database tables
- **agents**: your life team, bot tokens, status
- **goals**: tasks and priorities
- **metrics**: daily tracking (protein, workouts, expenses, etc.)
- **messages**: inter-agent communication
- **activity**: immutable audit log
- **notifications**: queue for Telegram messages

## Telegram flow
1. `lc notify` inserts into `notifications`
2. `telegram-sender.sh` sends via the agent's bot token
3. Sent notifications are marked as delivered

## Routine flow
Cron runs scripts in `routines/`, which:
- check in and nudge the right agent
- send warm, focused prompts
- keep your day aligned without noise
