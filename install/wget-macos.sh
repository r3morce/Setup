#!/bin/bash
# Install wget - Internet file retriever

set -e

echo "==> Installing wget..."

if ! command -v wget &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install wget
        echo "wget installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "wget is already installed"
fi