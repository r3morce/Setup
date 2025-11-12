#!/bin/bash
# Install git - Distributed version control system

set -e

echo "==> Installing git..."

if ! command -v git &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install git
        echo "git installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "git is already installed"
fi