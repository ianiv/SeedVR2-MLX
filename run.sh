#!/usr/bin/env bash
# Standalone launcher (no Pinokio). Starts the web UI and opens it in the browser.
# Extra arguments are passed through, e.g. ./run.sh --port 8000
# Optional: SEEDVR2_MEM_LIMIT_GB=12 ./run.sh to cap Metal memory.
set -euo pipefail
cd "$(dirname "$0")/app"

if [[ ! -x env/bin/python ]]; then
  echo "Not installed yet. Run ./setup.sh first." >&2
  exit 1
fi

exec env/bin/python app.py --open "$@"
