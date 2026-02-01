# Detect OS
OS := $(shell uname -s)
ifeq ($(OS),Darwin)
	SUFFIX := macos
	OS_NAME := macOS
else
	# Check if we're on Nobara/Fedora
	ifneq ($(shell which dnf 2>/dev/null),)
		SUFFIX := nobara
		OS_NAME := Nobara/Fedora
	else
		SUFFIX := cachyos
		OS_NAME := CachyOS
	endif
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
	@./scripts/install-packages-$(SUFFIX).sh || echo "Some packages may have failed to install, continuing..."
	@./scripts/clean-configs.sh
	@./scripts/setup-configs.sh
	@echo "Full setup complete. Restart terminal."

setup:
	@./scripts/clean-configs.sh
	@./scripts/setup-configs.sh
	@echo "Setup complete. Restart terminal."

clean-configs:
	@./scripts/clean-configs.sh

backup:
	@./scripts/backup-configs.sh
