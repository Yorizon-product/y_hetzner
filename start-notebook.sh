#!/bin/bash
# Launch JupyterLab with Yorizon theme
# The theme CSS is injected via browser console on first load
# or persists via JupyterLab settings

cd "$(dirname "$0")"
echo "Starting Yorizon Hetzner notebook..."
echo "Theme: yorizon-theme.css will be auto-loaded"
echo ""
uv run jupyter lab \
  --no-browser \
  --ServerApp.tornado_settings='{"headers":{"Content-Security-Policy":"default-src '"'"'self'"'"' '"'"'unsafe-inline'"'"' '"'"'unsafe-eval'"'"' https://fonts.googleapis.com https://fonts.gstatic.com data: blob:;"}}' \
  hetzner-cli-101.ipynb
