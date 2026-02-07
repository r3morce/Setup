#!/bin/bash
set -e

echo "Removing existing configurations..."

configs=(
    "$HOME/.wezterm.lua"
)

for config in "${configs[@]}"; do
    if [ -e "$config" ] || [ -L "$config" ]; then
        echo "Removing: $config"
        rm -rf "$config"
    fi
done

echo "Existing configurations removed"
