#!/bin/bash
# Deploy Zellij configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$SETUP_DIR/config/zellij"
BACKUP_DIR="$SETUP_DIR/backup/zellij-$(date +%Y%m%d-%H%M%S)"

echo "==> Deploying Zellij configuration..."

# Create backup if config exists
if [ -d "$HOME/.config/zellij" ]; then
    echo "Creating backup at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/zellij" "$BACKUP_DIR/"
    rm -rf "$HOME/.config/zellij"
fi

# Deploy configuration
echo "Copying Zellij config and layouts..."
mkdir -p "$HOME/.config/zellij/layouts"
cp "$CONFIG_DIR/config.kdl" "$HOME/.config/zellij/config.kdl"
cp "$CONFIG_DIR/layouts/"*.kdl "$HOME/.config/zellij/layouts/"

# Deploy dev script
echo "Installing dev script to ~/.local/bin..."
mkdir -p "$HOME/.local/bin"
cp "$CONFIG_DIR/dev" "$HOME/.local/bin/dev"
chmod +x "$HOME/.local/bin/dev"

echo "==> Zellij configuration deployed successfully!"
echo "Use 'dev [directory]' to launch dev session"
