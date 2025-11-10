#!/bin/bash
# Install Git and related tools

set -e

echo "==> Installing Git tools..."

PACKAGES=(git github-cli lazygit)

for package in "${PACKAGES[@]}"; do
    if ! pacman -Q "$package" &>/dev/null; then
        echo "Installing $package..."
        sudo pacman -S --noconfirm "$package"
    else
        echo "$package is already installed"
    fi
done

echo "==> Git installation complete!"
echo "Note: Git configuration will be set up via config script"
