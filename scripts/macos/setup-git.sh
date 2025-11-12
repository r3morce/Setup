#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/../../.env" ]; then
    source "$SCRIPT_DIR/../../.env"
    echo "Configuring git..."
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
    git config --global core.excludesfile ~/.gitignore_global
    [ ! -f "$HOME/.gitignore_global" ] && echo "**/.claude/settings.local.json" > "$HOME/.gitignore_global"
    echo "Git configured"
else
    echo ".env file not found for git configuration"
fi