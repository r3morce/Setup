#!/bin/bash
# Install gcc - GNU Compiler Collection

set -e

echo "==> Installing gcc..."

if ! command -v gcc &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install gcc
        echo "gcc installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "gcc is already installed"
fi