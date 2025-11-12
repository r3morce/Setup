#!/bin/bash
# Install wezterm - GPU-accelerated terminal emulator

set -e

echo "==> Installing wezterm..."

# Check if wezterm is already installed (either command exists or app exists)
if command -v wezterm &>/dev/null || [ -d "/Applications/WezTerm.app" ]; then
    echo "wezterm is already installed"
else
    if command -v brew &>/dev/null; then
        brew install --cask wezterm || echo "wezterm installation failed, but may already be installed"
        echo "wezterm installation completed"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
fi