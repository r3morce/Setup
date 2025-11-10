#!/bin/bash
# Deploy Neovim configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$SETUP_DIR/config/neovim"
BACKUP_DIR="$SETUP_DIR/backup/neovim-$(date +%Y%m%d-%H%M%S)"

echo "==> Deploying Neovim configuration..."

# Create backup if config exists
if [ -d "$HOME/.config/nvim" ]; then
    echo "Creating backup at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/nvim" "$BACKUP_DIR/"
    rm -rf "$HOME/.config/nvim"
fi

# Deploy configuration
echo "Copying Neovim config..."
mkdir -p "$HOME/.config"
cp -r "$CONFIG_DIR" "$HOME/.config/nvim"

echo "==> Neovim configuration deployed successfully!"
echo "Open nvim to let plugins install automatically"
