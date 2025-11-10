#!/bin/bash
# Install zoxide - Smarter cd command

set -e

echo "==> Installing zoxide..."

if ! brew list zoxide &>/dev/null; then
    brew install zoxide
    echo "zoxide installed successfully"
else
    echo "zoxide is already installed"
fi
