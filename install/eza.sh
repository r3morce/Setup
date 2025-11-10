#!/bin/bash
# Install eza - A modern replacement for ls

set -e

echo "==> Installing eza..."

if ! pacman -Q eza &>/dev/null; then
    sudo pacman -S --noconfirm eza
    echo "eza installed successfully"
else
    echo "eza is already installed"
fi
