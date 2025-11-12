#!/bin/bash
# Install gping - Ping with a graph

set -e

echo "==> Installing gping..."

if ! pacman -Q gping &>/dev/null; then
    sudo pacman -S --noconfirm gping
    echo "gping installed successfully"
else
    echo "gping is already installed"
fi
