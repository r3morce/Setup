#!/bin/bash
# Install zsh - Z shell

set -e

echo "==> Installing zsh..."

if ! pacman -Q zsh &>/dev/null; then
    sudo pacman -S --noconfirm zsh
    echo "zsh installed successfully"
else
    echo "zsh is already installed"
fi

# Install zsh plugins
echo "==> Installing zsh plugins..."

if ! pacman -Q zsh-autosuggestions &>/dev/null; then
    sudo pacman -S --noconfirm zsh-autosuggestions
    echo "zsh-autosuggestions installed successfully"
else
    echo "zsh-autosuggestions is already installed"
fi

if ! pacman -Q zsh-syntax-highlighting &>/dev/null; then
    sudo pacman -S --noconfirm zsh-syntax-highlighting
    echo "zsh-syntax-highlighting installed successfully"
else
    echo "zsh-syntax-highlighting is already installed"
fi

# Install powerlevel10k theme
if ! pacman -Q zsh-theme-powerlevel10k &>/dev/null; then
    sudo pacman -S --noconfirm zsh-theme-powerlevel10k
    echo "powerlevel10k theme installed successfully"
else
    echo "powerlevel10k theme is already installed"
fi

# Set ZSH as default shell if not already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting ZSH as default shell..."
    chsh -s "$(which zsh)"
fi

echo "==> ZSH installation complete!"
