#!/bin/bash
# Install nodejs - JavaScript runtime built on Chrome's V8 engine

set -e

echo "==> Installing nodejs and npm..."

if ! pacman -Q nodejs &>/dev/null; then
    sudo pacman -S --noconfirm nodejs npm
    echo "nodejs and npm installed successfully"
else
    echo "nodejs is already installed"
fi
