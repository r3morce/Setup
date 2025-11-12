#!/bin/bash
# Install yazi - Blazing fast terminal file manager

set -e

echo "==> Installing yazi..."

if ! command -v yazi &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install yazi
        echo "yazi installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "yazi is already installed"
fi