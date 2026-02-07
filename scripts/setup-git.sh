#!/bin/bash
set -e

cd "$(dirname "$0")/.."
if [ -f .env ]; then
    source .env
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
    git config --global core.excludesfile ~/.gitignore_global
    [ ! -f "$HOME/.gitignore_global" ] && echo "**/.claude/settings.local.json" > "$HOME/.gitignore_global"
    echo "Git configured"
else
    echo "No .env found, skipping git config"
fi
