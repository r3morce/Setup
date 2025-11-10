#!/bin/bash
# Install github-cli (gh) - GitHub's official command line tool

set -e

echo "==> Installing github-cli..."

if ! pacman -Q github-cli &>/dev/null; then
    sudo pacman -S --noconfirm github-cli
    echo "github-cli installed successfully"
else
    echo "github-cli is already installed"
fi
