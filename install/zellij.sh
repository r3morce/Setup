#!/bin/bash
# Install zellij - Terminal workspace with batteries included

set -e

echo "==> Installing zellij..."

if ! pacman -Q zellij &>/dev/null; then
    sudo pacman -S --noconfirm zellij
    echo "zellij installed successfully"
else
    echo "zellij is already installed"
fi
