#!/bin/bash
# Install nodejs - JavaScript runtime built on Chrome's V8 engine

set -e

echo "==> Installing nodejs and npm..."

if ! command -v node &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install node
        echo "nodejs and npm installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "nodejs is already installed"
fi