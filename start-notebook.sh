#!/bin/bash
# Launch JupyterLab with Yorizon theme

set -e
cd "$(dirname "$0")"

echo "=== Yorizon Hetzner Notebook ==="
echo ""

# Check prerequisites
if ! command -v uv &>/dev/null; then
  echo "Error: uv is not installed. See https://docs.astral.sh/uv/"
  exit 1
fi

# Sync dependencies
echo "Installing dependencies..."
uv sync
echo "Done."
echo ""

# Pick a port (default 8888, override with PORT env var)
PORT="${PORT:-8888}"

echo "Starting JupyterLab on http://localhost:${PORT}"
echo "Theme: apply yorizon-theme.css via browser console (see README)"
echo ""

uv run jupyter lab \
  --no-browser \
  --port="${PORT}" \
  --ServerApp.tornado_settings='{"headers":{"Content-Security-Policy":"default-src '"'"'self'"'"' '"'"'unsafe-inline'"'"' '"'"'unsafe-eval'"'"' https://fonts.googleapis.com https://fonts.gstatic.com data: blob:;"}}' \
  hetzner-cli-101.ipynb
