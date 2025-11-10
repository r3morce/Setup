#!/bin/bash
# Install bat - A cat clone with syntax highlighting

set -e

echo "==> Installing bat..."

if ! pacman -Q bat &>/dev/null; then
    sudo pacman -S --noconfirm bat
    echo "bat installed successfully"
else
    echo "bat is already installed"
fi
