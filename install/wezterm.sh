#!/bin/bash
# Install wezterm - GPU-accelerated cross-platform terminal emulator

set -e

echo "==> Installing wezterm..."

if ! pacman -Q wezterm &>/dev/null; then
    sudo pacman -S --noconfirm wezterm
    echo "wezterm installed successfully"
else
    echo "wezterm is already installed"
fi
