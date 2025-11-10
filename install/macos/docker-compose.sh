#!/bin/bash
# Install docker-compose - Define and run multi-container Docker applications

set -e

echo "==> Installing docker-compose..."

if ! brew list docker-compose &>/dev/null; then
    brew install docker-compose
    echo "docker-compose installed successfully"
else
    echo "docker-compose is already installed"
fi
