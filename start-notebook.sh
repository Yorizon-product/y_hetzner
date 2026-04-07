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

# Load HCLOUD_TOKEN from 1Password if not already set
if [ -z "$HCLOUD_TOKEN" ]; then
  if command -v op &>/dev/null; then
    echo "Loading HCLOUD_TOKEN from 1Password..."
    export HCLOUD_TOKEN="$(op read 'op://terminal access/Hetzner Cloud API Key/credential')"
    echo "Done."
  else
    echo "Warning: HCLOUD_TOKEN is not set and 1Password CLI (op) is not installed."
    echo "  Set it manually:  export HCLOUD_TOKEN=\"your-token\""
    echo "  Or install op:    https://developer.1password.com/docs/cli/"
  fi
else
  echo "HCLOUD_TOKEN already set."
fi
echo ""

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
