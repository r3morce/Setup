#!/bin/bash
# Install GitHub CLI - Command-line tool for GitHub

set -e

echo "==> Installing GitHub CLI..."

if ! command -v gh &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install gh
        echo "GitHub CLI installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "GitHub CLI is already installed"
fi