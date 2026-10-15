#!/usr/bin/env bash
# Standalone install (no Pinokio). Creates app/env and installs dependencies.
# Mirrors install.js. Re-run any time to update dependencies.
set -euo pipefail
cd "$(dirname "$0")/app"

if [[ "$(uname -s)" != "Darwin" || "$(uname -m)" != "arm64" ]]; then
  echo "SeedVR2-MLX requires an Apple Silicon Mac (MLX)." >&2
  exit 1
fi

if ! command -v uv >/dev/null 2>&1; then
  echo "Installing uv..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

[[ -d env ]] || uv venv env --python 3.12

# mflux is installed --no-deps to skip torch/transformers/matplotlib.
uv pip install --python env/bin/python --no-deps mflux==0.20.0
uv pip install --python env/bin/python -r requirements.txt

echo
echo "Setup complete. Start the app with ./run.sh"
