#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIR="$SCRIPT_DIR/../stow-packages"

echo "Deploying configurations..."

cd "$STOW_DIR" && stow -t ~ zsh neovim wezterm alacritty zellij bat

./scripts/config-git.sh

echo "All configurations deployed"