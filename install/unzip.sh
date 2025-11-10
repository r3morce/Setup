#!/bin/bash
# Install unzip - Extract compressed files in a ZIP archive

set -e

echo "==> Installing unzip..."

if ! pacman -Q unzip &>/dev/null; then
    sudo pacman -S --noconfirm unzip
    echo "unzip installed successfully"
else
    echo "unzip is already installed"
fi
