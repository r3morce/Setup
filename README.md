# Development Environment Setup

This repository contains dotfiles and automated setup scripts for quickly configuring a development environment on CachyOS (Arch Linux) and macOS.

## Quick Start

### First Time Setup

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url> ~/Setup
   cd ~/Setup
   ```

2. **Create your environment file:**
   ```bash
   cp .env.example .env
   # Edit .env with your personal information
   nano .env
   ```

3. **Run full setup:**

   **On macOS:**
   ```bash
   ./setup-macos.sh full
   ```

   **On CachyOS/Arch Linux:**
   ```bash
   ./setup-cachyos.sh full
   ```

## What's Included

### Tools & Applications

- **Shell:** ZSH with Powerlevel10k theme
- **Editor:** Neovim with LazyVim configuration
- **Terminal Emulators:** WezTerm, Alacritty
- **Terminal Multiplexer:** Zellij
- **CLI Tools:**
  - `bat` - Modern cat replacement with syntax highlighting
  - `eza` - Modern ls replacement
  - `duf` - Disk usage utility
  - `ripgrep` - Fast file content search
  - `fzf` - Fuzzy finder
  - `zoxide` - Smart cd replacement
  - `lazygit` - Terminal UI for git
  - `gh` - GitHub CLI
  - `fastfetch` - System information
  - `gping` - Ping with a graph

### Configuration Files

- **Alacritty:** `config/alacritty/alacritty.toml`
- **WezTerm:** `config/wezterm/wezterm.lua`
- **Zellij:** `config/zellij/config.kdl`
- **ZSH:** `config/zsh/zshrc` and `config/zsh/p10k.zsh`
- **Neovim:** `config/neovim/nvim/`

## Usage

### Install Specific Tools

**macOS:**
```bash
./setup-macos.sh install <tool>
```

**CachyOS:**
```bash
./setup-cachyos.sh install <tool>
```

Available tools: `all`, `homebrew` (macOS only), `packages`, `zsh`, `neovim`, `git`, `bat`, `eza`, etc.

### Deploy Specific Configurations

```bash
./setup-macos.sh config <tool>    # macOS
./setup-cachyos.sh config <tool>  # CachyOS
```

Available configs: `all`, `zsh`, `git`, `neovim`, `wezterm`, `alacritty`, `zellij`, `bat`

### Examples

```bash
# Install only Homebrew (macOS)
./setup-macos.sh install homebrew

# Install all packages
./setup-macos.sh install packages

# Deploy only ZSH configuration
./setup-macos.sh config zsh

# Install specific tool
./setup-macos.sh install bat
```

## Environment Variables

The `.env` file contains sensitive information that should not be committed:

- `GIT_USER_NAME` - Your Git username
- `GIT_USER_EMAIL` - Your Git email
- `SHELL_BROWSER` - Default browser
- `SHELL_EDITOR` - Default editor

## Platform Differences

### macOS
- Uses Homebrew as package manager
- GUI apps installed as casks
- Powerlevel10k installed via Homebrew

### CachyOS/Arch Linux
- Uses pacman as package manager
- Powerlevel10k installed from AUR/repos
- Some additional AUR packages may be required

## Backup

All deployment scripts automatically create timestamped backups in the `backup/` directory before overwriting existing configurations.

## Manual Steps

Some steps may require manual intervention:

1. **ZSH as default shell:** May require logging out and back in
2. **Terminal font:** Install a Nerd Font for proper icon display
3. **GitHub authentication:** Run `gh auth login` after installation

## Troubleshooting

### macOS: Command not found after installation
Make sure to restart your terminal or run:
```bash
source ~/.zshrc
```

### Powerlevel10k not loading
Ensure you've restarted your terminal and run:
```bash
p10k configure
```

### Git config not applied
Make sure `.env` file exists and contains your information, then run:
```bash
./scripts/deploy-git.sh
```

## Contributing

Feel free to customize any configuration files to match your preferences. The setup scripts are designed to be idempotent and can be run multiple times safely.

## License

Personal dotfiles - use freely.
