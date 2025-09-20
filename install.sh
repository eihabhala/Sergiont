#!/bin/bash

# Sergiont Installation Script

echo "Installing Sergiont - Neovim Trading Extension..."

# Determine the installation directory
if [ -z "$XDG_DATA_HOME" ]; then
    NVIM_DIR="$HOME/.local/share/nvim/site/pack/sergiont/start"
else
    NVIM_DIR="$XDG_DATA_HOME/nvim/site/pack/sergiont/start"
fi

# Create the directory if it doesn't exist
mkdir -p "$NVIM_DIR"

# Copy the plugin files
echo "Copying plugin files to $NVIM_DIR/sergiont..."
cp -r . "$NVIM_DIR/sergiont"

# Check if the copy was successful
if [ $? -eq 0 ]; then
    echo "Sergiont installed successfully!"
    echo ""
    echo "To complete the installation, add the following to your init.vim or init.lua:"
    echo ""
    echo "For init.vim:"
    echo "  Plug 'sergiont'  # if using vim-plug"
    echo ""
    echo "For init.lua:"
    echo "  -- If using packer.nvim:"
    echo "  use 'sergiont'"
    echo ""
    echo "  -- If using built-in package management:"
    echo "  -- No additional configuration needed"
    echo ""
    echo "Then run :SergiontSetup in Neovim to initialize the plugin."
else
    echo "Installation failed. Please check the error messages above."
    exit 1
fi