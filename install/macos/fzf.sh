#!/bin/bash
# Install fzf - Command-line fuzzy finder

set -e

echo "==> Installing fzf..."

if ! command -v fzf &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install fzf
        echo "fzf installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "fzf is already installed"
fi