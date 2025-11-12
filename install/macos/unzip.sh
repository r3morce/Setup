#!/bin/bash
# Install unzip - Extract ZIP archives

set -e

echo "==> Installing unzip..."

if ! command -v unzip &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install unzip
        echo "unzip installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "unzip is already installed"
fi