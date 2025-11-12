#!/bin/bash
# Install zellij - Terminal multiplexer

set -e

echo "==> Installing zellij..."

if ! command -v zellij &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install zellij
        echo "zellij installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "zellij is already installed"
fi