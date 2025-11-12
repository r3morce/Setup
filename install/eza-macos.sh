#!/bin/bash
# Install eza - A modern replacement for ls

set -e

echo "==> Installing eza..."

if ! command -v eza &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install eza
        echo "eza installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "eza is already installed"
fi