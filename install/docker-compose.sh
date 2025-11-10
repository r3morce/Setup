#!/bin/bash
# Install docker-compose - Define and run multi-container Docker applications

set -e

echo "==> Installing docker-compose..."

if ! pacman -Q docker-compose &>/dev/null; then
    sudo pacman -S --noconfirm docker-compose
    echo "docker-compose installed successfully"
else
    echo "docker-compose is already installed"
fi
