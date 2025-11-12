#!/bin/bash

echo "Installing packages..."

# Change to script directory so relative paths work correctly
# This ensures ../install/ paths work regardless of where script is called from
cd "$(dirname "$0")"
. ../install/stow-macos.sh
. ../install/neovim-macos.sh
. ../install/git-macos.sh
. ../install/bat-macos.sh
. ../install/eza-macos.sh
. ../install/ripgrep-macos.sh
. ../install/fzf-macos.sh
. ../install/zoxide-macos.sh
. ../install/docker-compose-macos.sh
. ../install/zellij-macos.sh
. ../install/wezterm-macos.sh
. ../install/lazygit-macos.sh
. ../install/github-cli-macos.sh
. ../install/fastfetch-macos.sh
. ../install/gping-macos.sh
. ../install/wget-macos.sh
. ../install/yazi-macos.sh

echo "All packages installed"