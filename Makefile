.PHONY: setup backup help

help:
	@echo "CachyOS Setup"
	@echo ""
	@echo "Targets:"
	@echo "  setup             Complete setup (install + config)"
	@echo "  backup            Backup existing configs"
	@echo "  help              Show this help"
	@echo ""
	@echo "Examples:"
	@echo "  make setup         # Complete setup"
	@echo "  make backup        # Backup existing configs"

setup:
	@./scripts/install-all.sh
	@./scripts/config-all.sh
	@./scripts/config-git.sh

	@echo "Setup complete. Restart terminal."

backup:
	@./scripts/backup.sh
