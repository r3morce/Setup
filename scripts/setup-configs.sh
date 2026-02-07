#!/bin/bash
set -e

cd "$(dirname "$0")/../stow-packages"
stow -v -t ~ wezterm
echo "Configs deployed"
