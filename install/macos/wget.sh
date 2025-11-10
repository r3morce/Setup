#!/bin/bash
# Install wget - Network downloader

set -e

echo "==> Installing wget..."

if ! brew list wget &>/dev/null; then
    brew install wget
    echo "wget installed successfully"
else
    echo "wget is already installed"
fi
