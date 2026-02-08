#!/usr/bin/env bash
set -euo pipefail

echo "✨ Setting up your Life Control agents..."

lc init

echo "🤖 Registering your life team..."

lc register wellness-coach "Nutrition & Fitness Tracker" "protein, food intake, exercise, body metrics" "${WELLNESS_BOT_TOKEN:-YOUR_WELLNESS_BOT_TOKEN}"
lc register money-mentor "Financial Advisor & Tracker" "budget, investments, expenses, financial goals" "${FINANCE_BOT_TOKEN:-YOUR_FINANCE_BOT_TOKEN}"
lc register style-guru "Fashion & Style Consultant" "wardrobe, outfits, shopping, personal style" "${FASHION_BOT_TOKEN:-YOUR_FASHION_BOT_TOKEN}"
lc register career-catalyst "Career Growth & Development" "skills, networking, job opportunities, professional goals" "${CAREER_BOT_TOKEN:-YOUR_CAREER_BOT_TOKEN}"
lc register vision-keeper "Life Goals & Vision Tracker" "long-term goals, milestones, bucket list, life purpose" "${GOALS_BOT_TOKEN:-YOUR_GOALS_BOT_TOKEN}"
lc register heart-connector "Relationship & Social Wellness" "partner check-ins, friendships, family, social connections" "${RELATIONSHIP_BOT_TOKEN:-YOUR_RELATIONSHIP_BOT_TOKEN}"
lc register soul-guide "Spiritual Growth & Inner Peace" "meditation, gratitude, mindfulness, spiritual practices" "${SPIRITUAL_BOT_TOKEN:-YOUR_SPIRITUAL_BOT_TOKEN}"

lc register creative-spark "Creative Projects & Hobbies" "art, writing, music, creative pursuits" "${CREATIVE_BOT_TOKEN:-YOUR_CREATIVE_BOT_TOKEN}"

echo "🌈 Creating starter goals..."

LC_AGENT=wellness-coach lc add "Track daily protein intake (150g target)" nutrition wellness-coach 1
LC_AGENT=wellness-coach lc add "Log 3 workouts this week" fitness wellness-coach 2
LC_AGENT=wellness-coach lc add "Drink 8 glasses of water daily" health wellness-coach 2

LC_AGENT=money-mentor lc add "Review monthly budget" finance money-mentor 1
LC_AGENT=money-mentor lc add "Track all expenses this week" finance money-mentor 2
LC_AGENT=money-mentor lc add "Research investment opportunities" finance money-mentor 3

LC_AGENT=style-guru lc add "Organize closet by season" style style-guru 3
LC_AGENT=style-guru lc add "Plan outfits for the week" style style-guru 2

LC_AGENT=career-catalyst lc add "Update LinkedIn profile" career career-catalyst 2
LC_AGENT=career-catalyst lc add "Learn new skill this month" career career-catalyst 1
LC_AGENT=career-catalyst lc add "Network with 3 people" career career-catalyst 3

LC_AGENT=vision-keeper lc add "Define 2026 vision" life_goals vision-keeper 1
LC_AGENT=vision-keeper lc add "Review quarterly milestones" life_goals vision-keeper 2

LC_AGENT=heart-connector lc add "Schedule weekly date night" relationships heart-connector 1
LC_AGENT=heart-connector lc add "Call a friend today" relationships heart-connector 2
LC_AGENT=heart-connector lc add "Send appreciation message to partner" relationships heart-connector 1

LC_AGENT=soul-guide lc add "Morning meditation (10 min)" spiritual soul-guide 1
LC_AGENT=soul-guide lc add "Gratitude journaling" spiritual soul-guide 2
LC_AGENT=soul-guide lc add "Weekly spiritual reading" spiritual soul-guide 3

echo "💫 All set! Your life team is ready!"
