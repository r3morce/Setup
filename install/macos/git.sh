#!/bin/bash
# Install Git and related tools
# Note: Git is pre-installed on macOS

set -e

echo "==> Installing Git tools..."

# Git is pre-installed, but update it via Homebrew
if ! brew list git &>/dev/null; then
    echo "Installing git via Homebrew..."
    brew install git
else
    echo "git is already installed"
fi

# Install GitHub CLI
if ! brew list gh &>/dev/null; then
    echo "Installing gh..."
    brew install gh
else
    echo "gh is already installed"
fi

# Install LazyGit
if ! brew list lazygit &>/dev/null; then
    echo "Installing lazygit..."
    brew install lazygit
else
    echo "lazygit is already installed"
fi

echo "==> Git installation complete!"
echo "Note: Git configuration will be set up via config script"
