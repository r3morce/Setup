#!/bin/bash
# CachyOS Setup - Main orchestration script
# This script manages installation and configuration of your CachyOS environment

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
CachyOS Setup Script

Usage: $0 [COMMAND] [OPTIONS]

Commands:
    install [TOOL]
        Install packages and tools
        Tools: all, packages, zsh, neovim, git, bat, eza, duf, ripgrep, fzf, 
               zoxide, docker-compose, zellij, wezterm, gcc, nodejs, lazygit, 
               github-cli, fastfetch, gping, wget, unzip, unrar
        
    config [TOOL]
        Deploy configuration files
        Tools: all, zsh, git, neovim, wezterm, alacritty, zellij, bat
        
    full
        Run complete setup (install all + config all)
        
    help
        Show this help message

Examples:
    $0 full                    # Complete fresh setup
    $0 install all             # Install all packages
    $0 install bat             # Install only bat
    $0 config zsh              # Deploy only ZSH config
    $0 install zsh             # Install only ZSH
    
EOF
}

# Install functions
install_tool() {
    local tool="$1"
    local script="$SCRIPT_DIR/install/${tool}.sh"
    
    if [ -f "$script" ]; then
        print_info "Installing $tool..."
        "$script"
        print_success "$tool installed"
    else
        print_error "Install script not found: $tool"
        exit 1
    fi
}

install_packages() {
    print_info "Installing essential packages..."
    
    # CLI tools
    install_tool "bat"
    install_tool "eza"
    install_tool "duf"
    install_tool "ripgrep"
    install_tool "fzf"
    install_tool "zoxide"
    
    # Development tools
    install_tool "docker-compose"
    install_tool "zellij"
    install_tool "wezterm"
    install_tool "gcc"
    install_tool "nodejs"
    
    # Git tools
    install_tool "lazygit"
    install_tool "github-cli"
    
    # Utilities
    install_tool "fastfetch"
    install_tool "gping"
    install_tool "wget"
    install_tool "unzip"
    install_tool "unrar"
    
    print_success "All packages installed!"
}

install_zsh() {
    install_tool "zsh"
}

install_neovim() {
    install_tool "neovim"
}

install_git() {
    install_tool "git"
}

install_all() {
    print_info "Running full installation..."
    install_packages
    install_zsh
    install_neovim
    install_git
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
                packages)
                    install_packages
                    ;;
                zsh|neovim|git)
                    install_tool "$tool"
                    ;;
                bat|eza|duf|ripgrep|fzf|zoxide|docker-compose|zellij|wezterm|gcc|nodejs|lazygit|github-cli|fastfetch|gping|wget|unzip|unrar)
                    install_tool "$tool"
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
            print_info "Starting full CachyOS setup..."
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
