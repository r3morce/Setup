.PHONY: full setup clean-configs backup help

help:
	@echo "CachyOS Setup"
	@echo ""
	@echo "Targets:"
	@echo "  full              Complete setup (wipes configs)"
	@echo "  setup             Apply configurations only"
	@echo "  clean-configs     Remove existing configs"
	@echo "  backup            Backup existing configs"
	@echo "  help              Show this help"
	@echo ""

full:
	@./scripts/install-packages.sh
	@./scripts/clean-configs.sh
	@./scripts/setup-configs.sh
	@./scripts/setup-git.sh
	@echo "Full setup complete. Restart terminal."

setup:
	@./scripts/clean-configs.sh
	@./scripts/setup-configs.sh
	@./scripts/setup-git.sh
	@echo "Setup complete. Restart terminal."

clean-configs:
	@./scripts/clean-configs.sh

backup:
	@./scripts/backup-configs.sh
