#!/bin/bash
# macOS Setup - Main orchestration script
# This script manages installation and configuration of your macOS environment

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored messages
print_info() {
    echo -e "${BLUE}==>${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}!${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Show usage
show_usage() {
    cat << EOF
macOS Setup Script

Usage: $0 [COMMAND] [OPTIONS]

Commands:
    install [TOOL]
        Install packages and tools via Homebrew
        Tools: all, homebrew, packages, zsh, neovim, git, bat, eza, duf, ripgrep, 
               fzf, zoxide, docker-compose, zellij, wezterm, nodejs, lazygit, 
               github-cli, fastfetch, gping, wget, unzip, unrar
        
    config [TOOL]
        Deploy configuration files
        Tools: all, zsh, git, neovim, wezterm, alacritty, zellij, bat
        
    full
        Run complete setup (install homebrew + all packages + all configs)
        
    help
        Show this help message

Examples:
    $0 full                    # Complete fresh setup
    $0 install all             # Install Homebrew and all packages
    $0 install homebrew        # Install only Homebrew
    $0 install bat             # Install only bat
    $0 config zsh              # Deploy only ZSH config

EOF
}

# Install Homebrew
install_homebrew() {
    if command -v brew &>/dev/null; then
        print_success "Homebrew is already installed"
        return 0
    fi
    
    print_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> "$HOME/.zprofile"
        eval "$(/usr/local/bin/brew shellenv)"
    fi
    
    print_success "Homebrew installed successfully"
}

# Install packages using Homebrew
install_with_brew() {
    local package="$1"
    local cask="${2:-false}"
    
    if [ "$cask" = "true" ]; then
        if brew list --cask "$package" &>/dev/null; then
            print_success "$package is already installed"
        else
            print_info "Installing $package..."
            brew install --cask "$package"
            print_success "$package installed"
        fi
    else
        if brew list "$package" &>/dev/null; then
            print_success "$package is already installed"
        else
            print_info "Installing $package..."
            brew install "$package"
            print_success "$package installed"
        fi
    fi
}

# Install CLI tools
install_packages() {
    print_info "Installing essential packages..."
    
    # CLI tools
    install_with_brew "bat"
    install_with_brew "eza"
    install_with_brew "duf"
    install_with_brew "ripgrep"
    install_with_brew "fzf"
    install_with_brew "zoxide"
    
    # Development tools
    install_with_brew "docker-compose"
    install_with_brew "zellij"
    install_with_brew "wezterm" "true"  # Cask for GUI app
    install_with_brew "node"
    
    # Git tools
    install_with_brew "lazygit"
    install_with_brew "gh"
    
    # Utilities
    install_with_brew "fastfetch"
    install_with_brew "gping"
    install_with_brew "wget"
    
    print_success "All packages installed!"
}

# Install ZSH and plugins
install_zsh() {
    print_info "Installing ZSH..."
    
    # ZSH comes pre-installed on macOS, but ensure it's the latest
    install_with_brew "zsh"
    
    # Create plugins directory
    mkdir -p "$HOME/.zsh/plugins"
    
    # Install zsh-autosuggestions
    if [ ! -d "$HOME/.zsh/plugins/zsh-autosuggestions" ]; then
        print_info "Installing zsh-autosuggestions..."
        git clone https://github.com/zsh-users/zsh-autosuggestions \
            "$HOME/.zsh/plugins/zsh-autosuggestions"
    fi
    
    # Install zsh-syntax-highlighting
    if [ ! -d "$HOME/.zsh/plugins/zsh-syntax-highlighting" ]; then
        print_info "Installing zsh-syntax-highlighting..."
        git clone https://github.com/zsh-users/zsh-syntax-highlighting \
            "$HOME/.zsh/plugins/zsh-syntax-highlighting"
    fi
    
    # Install Powerlevel10k
    install_with_brew "powerlevel10k"
    
    # Set ZSH as default shell if not already
    if [ "$SHELL" != "$(which zsh)" ]; then
        print_info "Setting ZSH as default shell..."
        chsh -s "$(which zsh)"
    fi
    
    print_success "ZSH installation complete!"
}

# Install Neovim
install_neovim() {
    print_info "Installing Neovim..."
    install_with_brew "neovim"
    print_success "Neovim installed"
}

# Install Git
install_git() {
    print_info "Installing Git..."
    install_with_brew "git"
    print_success "Git installed"
}

# Install Alacritty
install_alacritty() {
    print_info "Installing Alacritty..."
    install_with_brew "alacritty" "true"
    print_success "Alacritty installed"
}

# Install all
install_all() {
    print_info "Running full installation..."
    install_homebrew
    install_packages
    install_zsh
    install_neovim
    install_git
    install_alacritty
    print_success "All installation complete!"
}

# Config deployment functions
deploy_zsh() {
    print_info "Deploying ZSH configuration..."
    "$SCRIPT_DIR/scripts/deploy-zsh.sh"
    print_success "ZSH config deployed"
}

deploy_git() {
    print_info "Deploying Git configuration..."
    "$SCRIPT_DIR/scripts/deploy-git.sh"
    print_success "Git config deployed"
}

deploy_neovim() {
    print_info "Deploying Neovim configuration..."
    "$SCRIPT_DIR/scripts/deploy-neovim.sh"
    print_success "Neovim config deployed"
}

deploy_wezterm() {
    print_info "Deploying WezTerm configuration..."
    "$SCRIPT_DIR/scripts/deploy-wezterm.sh"
    print_success "WezTerm config deployed"
}

deploy_alacritty() {
    print_info "Deploying Alacritty configuration..."
    "$SCRIPT_DIR/scripts/deploy-alacritty.sh"
    print_success "Alacritty config deployed"
}

deploy_zellij() {
    print_info "Deploying Zellij configuration..."
    "$SCRIPT_DIR/scripts/deploy-zellij.sh"
    print_success "Zellij config deployed"
}

deploy_bat() {
    print_info "Configuring Bat..."
    "$SCRIPT_DIR/scripts/deploy-bat.sh"
    print_success "Bat configured"
}

deploy_all() {
    print_info "Deploying all configurations..."
    deploy_zsh
    deploy_git
    deploy_neovim
    deploy_wezterm
    deploy_alacritty
    deploy_zellij
    deploy_bat
    print_success "All configurations deployed!"
}

# Main script logic
main() {
    if [ $# -eq 0 ]; then
        show_usage
        exit 0
    fi

    case "$1" in
        install)
            local tool="${2:-all}"
            case "$tool" in
                all)
                    install_all
                    ;;
                homebrew)
                    install_homebrew
                    ;;
                packages)
                    install_homebrew
                    install_packages
                    ;;
                zsh)
                    install_homebrew
                    install_zsh
                    ;;
                neovim)
                    install_homebrew
                    install_neovim
                    ;;
                git)
                    install_homebrew
                    install_git
                    ;;
                alacritty)
                    install_homebrew
                    install_alacritty
                    ;;
                bat|eza|duf|ripgrep|fzf|zoxide|docker-compose|zellij|wezterm|nodejs|lazygit|github-cli|fastfetch|gping|wget|unzip|unrar)
                    install_homebrew
                    install_with_brew "$tool"
                    ;;
                *)
                    print_error "Unknown install target: $tool"
                    show_usage
                    exit 1
                    ;;
            esac
            ;;
            
        config)
            case "${2:-all}" in
                all)
                    deploy_all
                    ;;
                zsh)
                    deploy_zsh
                    ;;
                git)
                    deploy_git
                    ;;
                neovim)
                    deploy_neovim
                    ;;
                wezterm)
                    deploy_wezterm
                    ;;
                alacritty)
                    deploy_alacritty
                    ;;
                zellij)
                    deploy_zellij
                    ;;
                bat)
                    deploy_bat
                    ;;
                *)
                    print_error "Unknown config target: $2"
                    show_usage
                    exit 1
                    ;;
            esac
            ;;
            
        full)
            print_info "Starting full macOS setup..."
            install_all
            echo ""
            deploy_all
            echo ""
            print_success "Setup complete! Please restart your terminal."
            ;;
            
        help|--help|-h)
            show_usage
            ;;
            
        *)
            print_error "Unknown command: $1"
            show_usage
            exit 1
            ;;
    esac
}

# Run main function
main "$@"
