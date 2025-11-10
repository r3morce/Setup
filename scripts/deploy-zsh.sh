#!/bin/bash
# Deploy ZSH configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"
CONFIG_DIR="$SETUP_DIR/config/zsh"
BACKUP_DIR="$SETUP_DIR/backup/zsh-$(date +%Y%m%d-%H%M%S)"

echo "==> Deploying ZSH configuration..."

# Create backup if files exist
if [ -f "$HOME/.zshrc" ] || [ -f "$HOME/.p10k.zsh" ]; then
    echo "Creating backup at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    [ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$BACKUP_DIR/"
    [ -f "$HOME/.p10k.zsh" ] && cp "$HOME/.p10k.zsh" "$BACKUP_DIR/"
fi

# Deploy configurations
echo "Deploying .zshrc..."
cp "$CONFIG_DIR/zshrc" "$HOME/.zshrc"

echo "Deploying .p10k.zsh..."
cp "$CONFIG_DIR/p10k.zsh" "$HOME/.p10k.zsh"

# Set environment variables
export EDITOR="nvim"

echo "==> ZSH configuration deployed successfully!"
echo "Run 'source ~/.zshrc' to apply changes"
