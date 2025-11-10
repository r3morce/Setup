#!/bin/bash
# Install wget - Network downloader

set -e

echo "==> Installing wget..."

if ! pacman -Q wget &>/dev/null; then
    sudo pacman -S --noconfirm wget
    echo "wget installed successfully"
else
    echo "wget is already installed"
fi
