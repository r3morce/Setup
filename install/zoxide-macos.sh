#!/bin/bash
# Install zoxide - Smart cd command

set -e

echo "==> Installing zoxide..."

if ! command -v zoxide &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install zoxide
        echo "zoxide installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "zoxide is already installed"
fi