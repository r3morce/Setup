#!/bin/bash
# Install ripgrep - Fast text search tool

set -e

echo "==> Installing ripgrep..."

if ! brew list ripgrep &>/dev/null; then
    brew install ripgrep
    echo "ripgrep installed successfully"
else
    echo "ripgrep is already installed"
fi
