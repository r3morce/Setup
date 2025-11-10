#!/bin/bash
# Install gcc - GNU Compiler Collection

set -e

echo "==> Installing gcc..."

if ! brew list gcc &>/dev/null; then
    brew install gcc
    echo "gcc installed successfully"
else
    echo "gcc is already installed"
fi
