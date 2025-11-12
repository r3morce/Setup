#!/bin/bash
# Install fastfetch - System information tool

set -e

echo "==> Installing fastfetch..."

if ! pacman -Q fastfetch &>/dev/null; then
    sudo pacman -S --noconfirm fastfetch
    echo "fastfetch installed successfully"
else
    echo "fastfetch is already installed"
fi
