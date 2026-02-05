# Development Environment Setup

Script-based setup system for CachyOS and macOS using Make.

## Quick Start

**Clone and setup:**
```bash
git clone https://github.com/r3morce/Setup.git ~/Setup
cd ~/Setup
make full
```

## Structure

```
~/Setup/
├── Makefile                   # Main orchestrator with OS detection
├── install/                   # Individual package installers
│   └── ... (one per package per OS)
├── scripts/                   # Configuration management
├── stow-packages/            # Configuration files for stow
└── backup/                   # Automatic backups
```

## Usage

```bash
make full              # Complete setup (install + configure)
make setup             # Apply configurations only
make clean-configs     # Remove existing configs
make backup            # Backup existing configs
```

## Platform Differences

**CachyOS:**
- Package manager: `pacman` (system package manager)
- Uses `install-packages-cachyos.sh` to orchestrate installations



**macOS:**
- Package manager: `brew` (Homebrew)
- Uses `install-packages-macos.sh` to orchestrate installations  

**Shared:**
- Configuration deployment: `setup-configs.sh` (uses stow to symlink configs)
- Git configuration: `setup-git.sh` (reads from .env file)
- Backup system: `backup-configs.sh` (timestamped backups)
- Config cleanup: `clean-configs.sh` (removes existing configs)

## Available Packages

List all available packages:
```bash
ls install/ | grep -E "(cachyos|macos)" | sort | uniq
```

Inspect individual package installation:
```bash
cat install/bat-cachyos.sh

cat install/neovim-macos.sh
```
