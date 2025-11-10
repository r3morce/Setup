#!/bin/bash
# Install lazygit - Simple terminal UI for git commands

set -e

echo "==> Installing lazygit..."

if ! brew list lazygit &>/dev/null; then
    brew install lazygit
    echo "lazygit installed successfully"
else
    echo "lazygit is already installed"
fi
