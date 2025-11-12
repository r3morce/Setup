#!/bin/bash
set -e

# Change to script directory so relative paths work correctly
# This ensures ../.env path works regardless of where script is called from
cd "$(dirname "$0")"
if [ -f ../.env ]; then
    source ../.env
    echo "Configuring git..."
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
    git config --global core.excludesfile ~/.gitignore_global
    [ ! -f "$HOME/.gitignore_global" ] && echo "**/.claude/settings.local.json" > "$HOME/.gitignore_global"
    echo "Git configured"
else
    echo ".env file not found for git configuration"
fi