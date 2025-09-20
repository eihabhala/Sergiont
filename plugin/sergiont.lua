-- Sergiont - Main plugin entry point
-- Trading indicators and bots management for Neovim

if vim.g.loaded_sergiont ~= nil then
  return
end

vim.g.loaded_sergiont = true

-- Define the commands that will be available in Neovim
vim.api.nvim_create_user_command('SergiontIndicatorNew', function(opts)
  require('sergiont.indicator').new(opts.fargs[1])
end, { nargs = 1, desc = 'Create a new trading indicator' })

vim.api.nvim_create_user_command('SergiontBotNew', function(opts)
  require('sergiont.bot').new(opts.fargs[1])
end, { nargs = 1, desc = 'Create a new trading bot' })

vim.api.nvim_create_user_command('SergiontDeploy', function(opts)
  require('sergiont.deploy').deploy(opts.fargs[1])
end, { nargs = 1, desc = 'Deploy indicator or bot' })

vim.api.nvim_create_user_command('SergiontTest', function(opts)
  require('sergiont.test').run_tests(opts.fargs[1])
end, { nargs = '*', desc = 'Run tests for indicator or bot' })

-- Setup function for plugin configuration
vim.api.nvim_create_user_command('SergiontSetup', function()
  require('sergiont').setup()
end, { desc = 'Setup Sergiont plugin' })