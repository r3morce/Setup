#!/bin/bash

echo "Installing packages..."

# Change to script directory so relative paths work correctly
# This ensures ../install/ paths work regardless of where script is called from
cd "$(dirname "$0")"
. ../install/zsh-nobara.sh
. ../install/fish-nobara.sh
. ../install/neovim-nobara.sh
. ../install/git-nobara.sh
. ../install/bat-nobara.sh
. ../install/eza-nobara.sh
. ../install/ripgrep-nobara.sh
. ../install/fzf-nobara.sh
. ../install/zoxide-nobara.sh
. ../install/docker-compose-nobara.sh
. ../install/wezterm-nobara.sh
. ../install/lazygit-nobara.sh
. ../install/github-cli-nobara.sh
. ../install/fastfetch-nobara.sh
. ../install/gping-nobara.sh
. ../install/wget-nobara.sh
. ../install/yazi-nobara.sh

echo "All packages installed"