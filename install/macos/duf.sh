#!/bin/bash
# Install duf - Disk Usage/Free Utility

set -e

echo "==> Installing duf..."

if ! brew list duf &>/dev/null; then
    brew install duf
    echo "duf installed successfully"
else
    echo "duf is already installed"
fi
