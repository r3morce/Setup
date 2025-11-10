#!/bin/bash
# Install eza - A modern replacement for ls

set -e

echo "==> Installing eza..."

if ! brew list eza &>/dev/null; then
    brew install eza
    echo "eza installed successfully"
else
    echo "eza is already installed"
fi
