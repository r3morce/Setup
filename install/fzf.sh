#!/bin/bash
# Install fzf - Command-line fuzzy finder

set -e

echo "==> Installing fzf..."

if ! pacman -Q fzf &>/dev/null; then
    sudo pacman -S --noconfirm fzf
    echo "fzf installed successfully"
else
    echo "fzf is already installed"
fi
