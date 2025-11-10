#!/bin/bash
# Install fastfetch - System information tool

set -e

echo "==> Installing fastfetch..."

if ! brew list fastfetch &>/dev/null; then
    brew install fastfetch
    echo "fastfetch installed successfully"
else
    echo "fastfetch is already installed"
fi
