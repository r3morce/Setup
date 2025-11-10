#!/bin/bash
# unzip is pre-installed on macOS

set -e

echo "==> Checking unzip..."

if command -v unzip &>/dev/null; then
    echo "unzip is already available (pre-installed on macOS)"
else
    echo "Installing unzip via Homebrew..."
    brew install unzip
fi
