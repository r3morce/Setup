#!/bin/bash
# Install lazygit - Simple terminal UI for git commands

set -e

echo "==> Installing lazygit..."

if ! command -v lazygit &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install lazygit
        echo "lazygit installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "lazygit is already installed"
fi