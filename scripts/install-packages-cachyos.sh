#!/bin/bash

echo "Installing packages..."

cd "$(dirname "$0")"
sudo pacman -S --needed --noconfirm - < ../packages-cachyos.txt

echo "All packages installed"
