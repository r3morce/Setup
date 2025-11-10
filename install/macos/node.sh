#!/bin/bash
# Install node - JavaScript runtime built on Chrome's V8 engine

set -e

echo "==> Installing node and npm..."

if ! brew list node &>/dev/null; then
    brew install node
    echo "node and npm installed successfully"
else
    echo "node is already installed"
fi
