#!/bin/bash
# Install bat - A cat clone with syntax highlighting

set -e

echo "==> Installing bat..."

if ! brew list bat &>/dev/null; then
    brew install bat
    echo "bat installed successfully"
else
    echo "bat is already installed"
fi
