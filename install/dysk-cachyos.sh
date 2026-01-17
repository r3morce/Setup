#!/bin/bash
# Install dysk - Disk information tool

set -e

echo "==> Installing dysk..."

if ! pacman -Q dysk &>/dev/null; then
    sudo pacman -S --noconfirm dysk
    echo "dysk installed successfully"
else
    echo "dysk is already installed"
fi