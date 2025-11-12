#!/bin/bash
# Install bat - A cat clone with syntax highlighting

set -e

echo "==> Installing bat..."

if ! command -v bat &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install bat
        echo "bat installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "bat is already installed"
fi