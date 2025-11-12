#!/bin/bash
# Install docker-compose - Define and run multi-container Docker applications

set -e

echo "==> Installing docker-compose..."

if ! command -v docker-compose &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install docker-compose
        echo "docker-compose installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "docker-compose is already installed"
fi