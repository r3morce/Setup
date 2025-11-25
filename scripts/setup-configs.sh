#!/bin/bash
set -e

echo "Deploying configurations with stow..."

# Change to script directory so relative paths work correctly
# This ensures ./script and ../stow-packages paths work regardless of where script is called from
cd "$(dirname "$0")"
./clean-configs.sh

cd ../stow-packages
# stow creates symbolic links from packages to home directory
# -v: verbose mode shows what's being linked
# -t ~: target directory is the home directory
# neovim wezterm zsh: packages to symlink
stow -v -t ~ neovim wezterm zsh

cd ../scripts
./setup-git.sh

echo "All configurations deployed"