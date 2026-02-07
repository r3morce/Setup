OS := $(shell uname -s)
ifeq ($(OS),Darwin)
	SUFFIX := macos
	OS_NAME := macOS
else
	SUFFIX := cachyos
	OS_NAME := CachyOS
endif

.PHONY: full setup clean help

help:
	@echo "$(OS_NAME) Setup"
	@echo ""
	@echo "  make full     Install packages + deploy configs"
	@echo "  make setup    Deploy configs only"
	@echo "  make clean    Remove deployed configs"
	@echo ""

full:
	@./scripts/install-packages-$(SUFFIX).sh
	@./scripts/clean-configs.sh
	@./scripts/setup-configs.sh
	@./scripts/setup-git.sh
	@echo "Done. Restart your terminal."

setup:
	@./scripts/clean-configs.sh
	@./scripts/setup-configs.sh
	@./scripts/setup-git.sh
	@echo "Done. Restart your terminal."

clean:
	@./scripts/clean-configs.sh
