#!/bin/bash
# Install gcc - GNU Compiler Collection

set -e

echo "==> Installing gcc..."

if ! pacman -Q gcc &>/dev/null; then
    sudo pacman -S --noconfirm gcc
    echo "gcc installed successfully"
else
    echo "gcc is already installed"
fi
