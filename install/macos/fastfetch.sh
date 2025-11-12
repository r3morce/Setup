#!/bin/bash
# Install fastfetch - System information tool

set -e

echo "==> Installing fastfetch..."

if ! command -v fastfetch &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install fastfetch
        echo "fastfetch installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "fastfetch is already installed"
fi