#!/bin/bash
# Install stow - GNU Stow is a symlink farm manager

set -e

echo "==> Installing stow..."

if ! command -v stow &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install stow
        echo "stow installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "stow is already installed"
fi