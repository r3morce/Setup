#!/bin/bash
# Install Neovim and dependencies

set -e

echo "==> Installing Neovim and dependencies..."

# Install Neovim if not present
if ! pacman -Q neovim &>/dev/null; then
    sudo pacman -S --noconfirm neovim
fi

# Install dependencies for LazyVim
DEPS=(gcc nodejs npm)

for dep in "${DEPS[@]}"; do
    if ! pacman -Q "$dep" &>/dev/null; then
        echo "Installing $dep..."
        sudo pacman -S --noconfirm "$dep"
    fi
done

echo "==> Neovim installation complete!"
echo "Note: Config will be deployed separately via config script"
