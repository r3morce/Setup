#!/bin/bash
# Install duf - Disk Usage/Free Utility

set -e

echo "==> Installing duf..."

if ! pacman -Q duf &>/dev/null; then
    sudo pacman -S --noconfirm duf
    echo "duf installed successfully"
else
    echo "duf is already installed"
fi
