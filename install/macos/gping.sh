#!/bin/bash
# Install gping - Ping with a graph

set -e

echo "==> Installing gping..."

if ! brew list gping &>/dev/null; then
    brew install gping
    echo "gping installed successfully"
else
    echo "gping is already installed"
fi
