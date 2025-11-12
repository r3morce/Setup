#!/bin/bash
# Install ripgrep - Fast search tool

set -e

echo "==> Installing ripgrep..."

if ! command -v rg &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install ripgrep
        echo "ripgrep installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "ripgrep is already installed"
fi