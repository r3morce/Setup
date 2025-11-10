#!/bin/bash
# Install zoxide - Smarter cd command

set -e

echo "==> Installing zoxide..."

if ! pacman -Q zoxide &>/dev/null; then
    sudo pacman -S --noconfirm zoxide
    echo "zoxide installed successfully"
else
    echo "zoxide is already installed"
fi
