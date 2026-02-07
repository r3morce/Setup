# Setup

Package installation and dotfiles for CachyOS and macOS.

## Quick start

```bash
git clone https://github.com/r3morce/Setup.git ~/Setup
cd ~/Setup
cp .env.example .env  # edit with your git name/email
make full
```

## What it does

1. **Installs packages** from `packages-cachyos.txt` (pacman) or `Brewfile` (brew)
2. **Deploys wezterm config** via stow (`~/.wezterm.lua`)
3. **Configures git** (name, email, global gitignore from `.env`)

## Make targets

```
make full     Install packages + deploy configs
make setup    Deploy configs only
make clean    Remove deployed configs
```

## Structure

```
Makefile                  # entry point
packages-cachyos.txt     # CachyOS packages
Brewfile                  # macOS packages
.env.example              # git user config template
stow-packages/wezterm/    # wezterm config
scripts/
  install-packages-*.sh   # package installation
  setup-configs.sh        # stow deploy
  setup-git.sh            # git config from .env
  clean-configs.sh        # remove deployed configs
```
