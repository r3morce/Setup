#!/bin/bash
# Install zsh - Z shell

set -e

echo "==> Installing zsh..."

if ! command -v zsh &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install zsh
        echo "zsh installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "zsh is already installed"
fi

# Install zsh plugins
echo "==> Installing zsh plugins..."

if ! brew list zsh-autosuggestions &>/dev/null; then
    brew install zsh-autosuggestions
    echo "zsh-autosuggestions installed successfully"
else
    echo "zsh-autosuggestions is already installed"
fi

if ! brew list zsh-syntax-highlighting &>/dev/null; then
    brew install zsh-syntax-highlighting
    echo "zsh-syntax-highlighting installed successfully"
else
    echo "zsh-syntax-highlighting is already installed"
fi