#!/bin/bash
# Install unrar - Extract files from RAR archives

set -e

echo "==> Installing unrar..."

if ! pacman -Q unrar &>/dev/null; then
    sudo pacman -S --noconfirm unrar
    echo "unrar installed successfully"
else
    echo "unrar is already installed"
fi
