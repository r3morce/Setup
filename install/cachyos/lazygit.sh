#!/bin/bash
# Install lazygit - Simple terminal UI for git commands

set -e

echo "==> Installing lazygit..."

if ! pacman -Q lazygit &>/dev/null; then
    sudo pacman -S --noconfirm lazygit
    echo "lazygit installed successfully"
else
    echo "lazygit is already installed"
fi
