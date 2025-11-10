#!/bin/bash
# Deploy Alacritty configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$SETUP_DIR/config/alacritty"
BACKUP_DIR="$SETUP_DIR/backup/alacritty-$(date +%Y%m%d-%H%M%S)"

echo "==> Deploying Alacritty configuration..."

# Create backup if config exists
if [ -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    echo "Creating backup at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.config/alacritty/alacritty.toml" "$BACKUP_DIR/"
fi

# Deploy configuration
echo "Copying Alacritty config..."
mkdir -p "$HOME/.config/alacritty"
cp "$CONFIG_DIR/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

echo "==> Alacritty configuration deployed successfully!"
