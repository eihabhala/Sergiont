# Sergiont

A Neovim extension for deploying and managing trading indicators and bots for TradingView and other platforms.

## Features

- Syntax highlighting for Pine Script (TradingView)
- Indicator deployment tools
- Bot management and testing framework
- Integration with TradingView and other trading platforms

## Installation

### Using a Plugin Manager

If you use a plugin manager like `vim-plug`, add this to your `init.vim`:

```vim
Plug 'sergiont'
```

For `packer.nvim`, add this to your `init.lua`:

```lua
use 'sergiont'
```

### Manual Installation

1. Clone this repository to your Neovim plugins directory:

```bash
# If XDG_DATA_HOME is set
mkdir -p "$XDG_DATA_HOME/nvim/site/pack/sergiont/start"
cp -r . "$XDG_DATA_HOME/nvim/site/pack/sergiont/start/sergiont"

# Otherwise
mkdir -p "~/.local/share/nvim/site/pack/sergiont/start"
cp -r . "~/.local/share/nvim/site/pack/sergiont/start/sergiont"
```

2. Or run the installation script:

```bash
chmod +x install.sh
./install.sh
```

3. Run `:SergiontSetup` in Neovim to initialize the plugin.

## Usage

### Creating a New Indicator

```vim
:SergiontIndicatorNew MyIndicator
```

This will create a new Pine Script file in your indicators directory with a basic template.

### Creating a New Bot

```vim
:SergiontBotNew MyBot
```

This will create a new bot directory with a basic Python bot structure.

### Deploying Indicators or Bots

```vim
:SergiontDeploy MyIndicator
:SergiontDeploy MyBot
```

### Testing

```vim
:SergiontTest MyIndicator
:SergiontTest MyBot
:SergiontTest  "Run all tests"
```

## Configuration

You can configure Sergiont by calling the setup function in your `init.lua`:

```lua
require('sergiont').setup({
  tradingview = {
    api_key = "your_api_key",
    api_secret = "your_api_secret",
  },
  indicators_path = vim.fn.stdpath('data') .. '/sergiont/indicators',
  bots_path = vim.fn.stdpath('data') .. '/sergiont/bots',
  enable_pine_syntax = true,
  enable_tradingview_integration = false,
})
```