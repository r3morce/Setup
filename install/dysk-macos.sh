#!/bin/bash
# Install dysk - Disk information tool

set -e

echo "==> Installing dysk..."

if ! command -v dysk &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install dysk
        echo "dysk installed successfully via Homebrew"
    elif command -v cargo &>/dev/null; then
        cargo install dysk
        echo "dysk installed successfully via Cargo"
    else
        echo "Error: Neither Homebrew nor Cargo found. Please install one of them first."
        exit 1
    fi
else
    echo "dysk is already installed"
fi