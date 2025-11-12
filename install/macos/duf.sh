#!/bin/bash
# Install duf - Disk Usage/Free Utility

set -e

echo "==> Installing duf..."

if ! command -v duf &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install duf
        echo "duf installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "duf is already installed"
fi