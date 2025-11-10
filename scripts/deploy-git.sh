#!/bin/bash
# Deploy Git configuration

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_DIR="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$SETUP_DIR/backup/git-$(date +%Y%m%d-%H%M%S)"

# Load environment variables
if [ -f "$SETUP_DIR/.env" ]; then
    source "$SETUP_DIR/.env"
else
    echo "Error: .env file not found. Please copy .env.example to .env and fill in your details."
    exit 1
fi

echo "==> Configuring Git..."

# Create backup
if [ -f "$HOME/.gitconfig" ]; then
    echo "Creating backup at $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.gitconfig" "$BACKUP_DIR/"
fi

# Configure Git
echo "Setting Git user name and email..."
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"

echo "Setting Git protocol to HTTPS..."
gh config set git_protocol https 2>/dev/null || true

echo "Configuring Git to ignore .claude/settings.local.json..."
git config --global core.excludesfile ~/.gitignore_global

# Create global gitignore if it doesn't exist
if [ ! -f "$HOME/.gitignore_global" ]; then
    echo "**/.claude/settings.local.json" > "$HOME/.gitignore_global"
fi

echo "==> Git configuration complete!"
