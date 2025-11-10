#!/bin/bash
# Install fzf - Command-line fuzzy finder

set -e

echo "==> Installing fzf..."

if ! brew list fzf &>/dev/null; then
    brew install fzf
    echo "fzf installed successfully"
else
    echo "fzf is already installed"
fi
