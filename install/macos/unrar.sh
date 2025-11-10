#!/bin/bash
# Install unrar - Extract files from RAR archives

set -e

echo "==> Installing unrar..."

if ! brew list unrar &>/dev/null; then
    brew install unrar
    echo "unrar installed successfully"
else
    echo "unrar is already installed"
fi
