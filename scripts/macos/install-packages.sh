#!/bin/bash

echo "Installing packages..."

. ./install/macos/stow.sh
. ./install/macos/zsh.sh
. ./install/macos/neovim.sh
. ./install/macos/git.sh
. ./install/macos/bat.sh
. ./install/macos/eza.sh
. ./install/macos/duf.sh
. ./install/macos/ripgrep.sh
. ./install/macos/fzf.sh
. ./install/macos/zoxide.sh
. ./install/macos/docker-compose.sh
. ./install/macos/zellij.sh
. ./install/macos/wezterm.sh
. ./install/macos/gcc.sh
. ./install/macos/nodejs.sh
. ./install/macos/lazygit.sh
. ./install/macos/github-cli.sh
. ./install/macos/fastfetch.sh
. ./install/macos/gping.sh
. ./install/macos/wget.sh
. ./install/macos/unzip.sh
. ./install/macos/unrar.sh
. ./install/macos/yazi.sh

echo "All packages installed"