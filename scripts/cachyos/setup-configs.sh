#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_DIR="$(realpath "$SCRIPT_DIR/../../stow-packages")"

echo "Deploying configurations with stow..."

"$SCRIPT_DIR/clean-configs.sh"

cd "$STOW_DIR"
stow -v -t ~ neovim wezterm zellij zsh

"$SCRIPT_DIR/setup-git.sh"

echo "All configurations deployed"

