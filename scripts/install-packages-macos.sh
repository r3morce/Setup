#!/bin/bash

echo "Installing packages..."

cd "$(dirname "$0")"
brew bundle --file=../Brewfile

echo "All packages installed"
