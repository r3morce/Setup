# Detect OS
OS := $(shell uname -s)
ifeq ($(OS),Darwin)
	SCRIPT_DIR := scripts/macos
	OS_NAME := macOS
else
	SCRIPT_DIR := scripts/cachyos
	OS_NAME := CachyOS
endif

.PHONY: full setup clean-configs backup help

help:
	@echo "$(OS_NAME) Setup"
	@echo ""
	@echo "Detected OS: $(OS_NAME)"
	@echo ""
	@echo "Targets:"
	@echo "  full              Complete setup (wipes configs)"
	@echo "  setup             Apply configurations only"
	@echo "  clean-configs     Remove existing configs"
	@echo "  backup            Backup existing configs"
	@echo "  help              Show this help"
	@echo ""

full:
	@./$(SCRIPT_DIR)/install-packages.sh || echo "Some packages may have failed to install, continuing..."
	@./$(SCRIPT_DIR)/clean-configs.sh
	@./$(SCRIPT_DIR)/setup-configs.sh
	@./$(SCRIPT_DIR)/setup-git.sh
	@echo "Full setup complete. Restart terminal."

setup:
	@./$(SCRIPT_DIR)/clean-configs.sh
	@./$(SCRIPT_DIR)/setup-configs.sh
	@./$(SCRIPT_DIR)/setup-git.sh
	@echo "Setup complete. Restart terminal."

clean-configs:
	@./$(SCRIPT_DIR)/clean-configs.sh

backup:
	@./$(SCRIPT_DIR)/backup-configs.sh
