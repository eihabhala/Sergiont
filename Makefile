# Sergiont Makefile

# Variables
PLUGIN_NAME = sergiont
NVIM_PACKAGE_DIR = $(HOME)/.local/share/nvim/site/pack/$(PLUGIN_NAME)/start

# Install the plugin
install:
	@echo "Installing $(PLUGIN_NAME)..."
	@mkdir -p $(NVIM_PACKAGE_DIR)
	@cp -r . $(NVIM_PACKAGE_DIR)/$(PLUGIN_NAME)
	@echo "Installation complete!"

# Uninstall the plugin
uninstall:
	@echo "Uninstalling $(PLUGIN_NAME)..."
	@rm -rf $(NVIM_PACKAGE_DIR)/$(PLUGIN_NAME)
	@echo "Uninstallation complete!"

# Run tests
test:
	@echo "Running tests..."
	@nvim --headless -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.vim'}" -c "qa"

# Clean up
clean:
	@echo "Cleaning up..."
	@rm -rf $(HOME)/.local/share/nvim/sergiont

# Help
help:
	@echo "Sergiont Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make install     Install the plugin"
	@echo "  make uninstall   Uninstall the plugin"
	@echo "  make test        Run tests"
	@echo "  make clean       Clean up data directories"
	@echo "  make help        Show this help message"

.PHONY: install uninstall test clean help