# Development Environment Setup

Script-based setup system for CachyOS and macOS.

## Quick Start

**CachyOS:**
```bash
cd ~/Setup
./setup-cachyos.sh full
```

**macOS:**
```bash
cd ~/Setup
./setup-macos.sh full
```

## Structure

```
~/Setup/
├── setup-cachyos.sh          # CachyOS orchestrator
├── setup-macos.sh            # macOS orchestrator
├── install/
│   ├── cachyos/              # Install scripts (pacman)
│   └── macos/                # Install scripts (brew)
├── scripts/                   # Config deployment
├── config/                    # Configuration files
└── backup/                    # Automatic backups
```

## Usage

### Help
```bash
./setup-cachyos.sh help
./setup-macos.sh help
```

### Install
```bash
# All tools
./setup-cachyos.sh install all

# Categories
./setup-cachyos.sh install packages
./setup-cachyos.sh install zsh
./setup-cachyos.sh install neovim
./setup-cachyos.sh install git

# Individual tools
./setup-cachyos.sh install bat
./setup-cachyos.sh install ripgrep
```

### Configure
```bash
# All configs
./setup-cachyos.sh config all

# Individual configs
./setup-cachyos.sh config zsh
./setup-cachyos.sh config neovim
./setup-cachyos.sh config git
```

### Full Setup
```bash
./setup-cachyos.sh full    # Install all + configure all
```

## Platform Differences

**CachyOS:**
- Package manager: `pacman`
- Scripts: `install/cachyos/`

**macOS:**
- Package manager: `brew`
- Scripts: `install/macos/`
- Requires Homebrew installation

**Shared:**
- Configuration files: `config/`
- Deployment scripts: `scripts/`

## Backup

All deployments create timestamped backups in `backup/` before overwriting configs.

## Available Tools

List all tools:
```bash
ls install/cachyos/    # CachyOS
ls install/macos/      # macOS
```

Inspect installation:
```bash
cat install/cachyos/bat.sh
```
