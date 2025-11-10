#!/bin/bash
# Install wezterm - GPU-accelerated cross-platform terminal emulator

set -e

echo "==> Installing wezterm..."

if ! brew list --cask wezterm &>/dev/null; then
    brew install --cask wezterm
    echo "wezterm installed successfully"
else
    echo "wezterm is already installed"
fi
