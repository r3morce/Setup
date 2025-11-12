#!/bin/bash
set -e

echo "Removing existing configurations..."

# Remove existing configs that might conflict with stow
configs=(
    "$HOME/.zshrc"
    "$HOME/.p10k.zsh"
    "$HOME/.config/nvim"
    "$HOME/.wezterm.lua"
    "$HOME/.config/zellij"
    "$HOME/.config/config.kdl"
    "$HOME/.config/dev"
    "$HOME/.config/layouts"
)

for config in "${configs[@]}"; do
    if [ -e "$config" ] || [ -L "$config" ]; then
        echo "Removing: $config"
        rm -rf "$config"
    fi
done

echo "Existing configurations removed"