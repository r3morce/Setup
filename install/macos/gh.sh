#!/bin/bash
# Install gh - GitHub's official command line tool

set -e

echo "==> Installing gh..."

if ! brew list gh &>/dev/null; then
    brew install gh
    echo "gh installed successfully"
else
    echo "gh is already installed"
fi
