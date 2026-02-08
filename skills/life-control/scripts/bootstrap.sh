#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="${LIFE_CONTROL_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}"

export LC_DB="${LC_DB:-$HOME/.life-control/life.db}"

"$REPO_ROOT/lc" init

"$REPO_ROOT/setup-agents.sh"

echo "✅ Life Control personas registered."
