# Sergiont Documentation

Sergiont is a Neovim extension for deploying and managing trading indicators and bots for TradingView and other platforms.

## Table of Contents

1. [Installation](#installation)
2. [Configuration](#configuration)
3. [Usage](#usage)
   - [Indicator Management](#indicator-management)
   - [Bot Management](#bot-management)
   - [Deployment](#deployment)
   - [Testing](#testing)
4. [Examples](#examples)
5. [API Reference](#api-reference)

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

## Usage

### Indicator Management

#### Creating a New Indicator

```vim
:SergiontIndicatorNew MyIndicator
```

This will create a new Pine Script file in your indicators directory with a basic template.

#### Listing Indicators

```lua
local indicators = require('sergiont.indicator').list()
for _, indicator in ipairs(indicators) do
  print(indicator)
end
```

### Bot Management

#### Creating a New Bot

```vim
:SergiontBotNew MyBot
```

This will create a new bot directory with a basic Python bot structure.

#### Listing Bots

```lua
local bots = require('sergiont.bot').list()
for _, bot in ipairs(bots) do
  print(bot)
end
```

### Deployment

#### Deploying Indicators or Bots

```vim
:SergiontDeploy MyIndicator
:SergiontDeploy MyBot
```

### Testing

#### Running Tests

```vim
:SergiontTest MyIndicator
:SergiontTest MyBot
:SergiontTest  "Run all tests"
```

## Examples

### Pine Script Indicator

```pinescript
//@version=5
indicator("Simple Moving Average", overlay=true)

// Input for the moving average length
length = input.int(14, title="MA Length")

// Calculate the moving average
ma = ta.sma(close, length)

// Plot the moving average
plot(ma, color=color.blue, title="MA")

// Plot the closing price for reference
plot(close, color=color.gray, title="Close Price")
```

### Python Bot

```python
# Simple Trading Bot Example
import json
import time

class SimpleBot:
    def __init__(self, config_path):
        with open(config_path, 'r') as f:
            self.config = json.load(f)
        
        self.name = self.config['name']
        self.symbol = self.config.get('symbol', 'BTC/USD')
        self.timeframe = self.config.get('timeframe', '1h')
        
    def run(self):
        print(f"Starting {self.name}")
        print(f"Trading symbol: {self.symbol}")
        print(f"Timeframe: {self.timeframe}")
        
        # Main trading loop
        while True:
            # In a real bot, this would:
            # 1. Fetch market data
            # 2. Analyze the data
            # 3. Make trading decisions
            # 4. Execute trades
            
            print(f"{self.name} running... (simulated)")
            time.sleep(10)  # Wait 10 seconds before next iteration

if __name__ == "__main__":
    bot = SimpleBot('config.json')
    bot.run()
```

## API Reference

### Main Module

#### `setup(config)`

Initializes the plugin with the provided configuration.

### Indicator Module

#### `new(name)`

Creates a new indicator with the given name.

#### `list()`

Returns a list of all indicators.

### Bot Module

#### `new(name)`

Creates a new bot with the given name.

#### `list()`

Returns a list of all bots.

### Deploy Module

#### `deploy(target)`

Deploys the specified indicator or bot.

### Test Module

#### `run_tests([target])`

Runs tests for the specified indicator or bot, or all tests if no target is specified.