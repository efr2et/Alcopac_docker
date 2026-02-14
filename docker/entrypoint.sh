#!/usr/bin/env sh
set -eu

APP_DIR="/opt/lampac"
CONFIG_DIR="$APP_DIR/config"
TEMPLATES_DIR="$APP_DIR/templates"

mkdir -p "$CONFIG_DIR" "$APP_DIR/cache"

if [ ! -f "$CONFIG_DIR/current.conf" ]; then
  cp "$TEMPLATES_DIR/current.conf" "$CONFIG_DIR/current.conf"
fi

if [ ! -f "$CONFIG_DIR/init.json" ]; then
  cp "$TEMPLATES_DIR/init.json.example" "$CONFIG_DIR/init.json"
fi

exec /usr/local/bin/lampac-go
