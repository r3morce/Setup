#!/bin/bash
set -e

# Change to script directory so relative paths work correctly
# This ensures ../backup/ path works regardless of where script is called from
cd "$(dirname "$0")"
BACKUP_DIR="../backup/backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo "Backing up configs to: $BACKUP_DIR"

for path in "$HOME/.zshrc" "$HOME/.p10k.zsh" "$HOME/.gitconfig" "$HOME/.gitignore_global" "$HOME/.config/nvim" "$HOME/.wezterm.lua" "$HOME/.config/wezterm" "$HOME/.config/zellij" "$HOME/.config/bat"; do
    if [ -e "$path" ]; then
        cp -r "$path" "$BACKUP_DIR/"
        echo "Backed up: $path"
    fi
done

echo "Backup complete"