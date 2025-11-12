#!/bin/bash
# Install ripgrep - Fast text search tool

set -e

echo "==> Installing ripgrep..."

if ! pacman -Q ripgrep &>/dev/null; then
    sudo pacman -S --noconfirm ripgrep
    echo "ripgrep installed successfully"
else
    echo "ripgrep is already installed"
fi
