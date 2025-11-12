#!/bin/bash
# Install Neovim and dependencies

set -e

echo "==> Installing Neovim and dependencies..."

if ! command -v nvim &>/dev/null; then
    if command -v brew &>/dev/null; then
        brew install neovim
        echo "Neovim installed successfully via Homebrew"
    else
        echo "Error: Homebrew not found. Please install Homebrew first."
        exit 1
    fi
else
    echo "Neovim is already installed"
fi

# Install dependencies for LazyVim
DEPS=(nodejs npm)

for dep in "${DEPS[@]}"; do
    if ! command -v "$dep" &>/dev/null; then
        echo "Installing $dep..."
        if command -v brew &>/dev/null; then
            case $dep in
                "nodejs")
                    brew install node
                    ;;
                "npm")
                    # npm comes with node, but check separately
                    if ! command -v npm &>/dev/null; then
                        brew install node
                    fi
                    ;;
            esac
        else
            echo "Error: Homebrew not found. Please install Homebrew first."
            exit 1
        fi
    fi
done

echo "==> Neovim installation complete!"
echo "Note: Config will be deployed separately via config script"