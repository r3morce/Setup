#!/bin/bash
# Install unrar - Extract RAR archives

set -e

echo "==> Installing unrar..."

if ! command -v unrar &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install unrar
        echo "unrar installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "unrar is already installed"
fi