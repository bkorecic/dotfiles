#!/bin/bash

CONFIG_FILE="$HOME/.config/helix/config.toml"
LIGHT_THEME_NAME="github_light"
DARK_THEME_NAME="github_dark"

MODE=$(dms ipc call theme getMode 2>/dev/null)

if [[ "$MODE" == "light" ]]; then
  sed -i "s/^theme = \".*\"/theme = \"$LIGHT_THEME_NAME\"/" "$CONFIG_FILE"
elif [[ "$MODE" == "dark" ]]; then
  sed -i "s/^theme = \".*\"/theme = \"$DARK_THEME_NAME\"/" "$CONFIG_FILE"
else
  echo "Unknown theme mode: '$MODE'. Exiting."
  exit 1
fi

pkill -USR1 helix
