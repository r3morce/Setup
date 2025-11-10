#!/bin/bash
# Install zellij - Terminal workspace with batteries included

set -e

echo "==> Installing zellij..."

if ! brew list zellij &>/dev/null; then
    brew install zellij
    echo "zellij installed successfully"
else
    echo "zellij is already installed"
fi
