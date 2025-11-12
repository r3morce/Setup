#!/bin/bash
# Install gping - Ping, but with a graph

set -e

echo "==> Installing gping..."

if ! command -v gping &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install gping
        echo "gping installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "gping is already installed"
fi