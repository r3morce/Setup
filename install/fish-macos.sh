#!/bin/bash
# Install fish - friendly interactive shell

set -e

echo "==> Installing fish..."

if ! command -v fish &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install fish
        echo "fish installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "fish is already installed"
fi

# Install fisher plugin manager
echo "==> Installing fisher plugin manager..."
if ! fish -c "type -q fisher" &>/dev/null; then
    fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
    echo "fisher installed successfully"
else
    echo "fisher is already installed"
fi

# Install tide prompt
echo "==> Installing tide prompt..."
if ! fish -c "fisher list | grep -q tide" &>/dev/null; then
    fish -c "fisher install IlanCosman/tide@v6"
    echo "tide installed successfully"
else
    echo "tide is already installed"
fi

# Set fish as default shell if not already
if [ "$SHELL" != "$(which fish)" ]; then
    echo "Setting fish as default shell..."
    chsh -s "$(which fish)"
fi

echo "==> Fish installation complete!"
