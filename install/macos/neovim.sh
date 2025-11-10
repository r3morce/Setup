#!/bin/bash
# Install Neovim and dependencies

set -e

echo "==> Installing Neovim and dependencies..."

# Install Neovim
if ! brew list neovim &>/dev/null; then
    brew install neovim
fi

# Install dependencies for LazyVim (gcc and node)
if ! brew list gcc &>/dev/null; then
    echo "Installing gcc..."
    brew install gcc
fi

if ! brew list node &>/dev/null; then
    echo "Installing node..."
    brew install node
fi

echo "==> Neovim installation complete!"
echo "Note: Config will be deployed separately via config script"
