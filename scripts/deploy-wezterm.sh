#!/bin/bash
# Deploy WezTerm configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$SETUP_DIR/config/wezterm"
BACKUP_DIR="$SETUP_DIR/backup/wezterm-$(date +%Y%m%d-%H%M%S)"

echo "==> Deploying WezTerm configuration..."

# Create backup if config exists
if [ -d "$HOME/.config/wezterm" ]; then
    echo "Creating backup at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/wezterm" "$BACKUP_DIR/"
    rm -rf "$HOME/.config/wezterm"
fi

# Deploy configuration
echo "Copying WezTerm config..."
mkdir -p "$HOME/.config"
cp -r "$CONFIG_DIR" "$HOME/.config/wezterm"

echo "==> WezTerm configuration deployed successfully!"
