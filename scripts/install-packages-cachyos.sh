#!/bin/bash

echo "Installing packages..."

# Change to script directory so relative paths work correctly
# This ensures ../install/ paths work regardless of where script is called from
cd "$(dirname "$0")"
. ../install/zsh-cachyos.sh
. ../install/neovim-cachyos.sh
. ../install/git-cachyos.sh
. ../install/bat-cachyos.sh
. ../install/eza-cachyos.sh
. ../install/ripgrep-cachyos.sh
. ../install/fzf-cachyos.sh
. ../install/zoxide-cachyos.sh
. ../install/docker-compose-cachyos.sh
. ../install/wezterm-cachyos.sh
. ../install/lazygit-cachyos.sh
. ../install/github-cli-cachyos.sh
. ../install/fastfetch-cachyos.sh
. ../install/gping-cachyos.sh
. ../install/wget-cachyos.sh
. ../install/yazi-cachyos.sh

echo "All packages installed"