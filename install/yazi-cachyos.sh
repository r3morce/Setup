#!/bin/bash
# Install yazi - Blazing fast terminal file manager

set -e

echo "==> Installing yazi..."

if ! pacman -Q yazi &>/dev/null; then
    sudo pacman -S --noconfirm yazi
    echo "yazi installed successfully"
else
    echo "yazi is already installed"
fi