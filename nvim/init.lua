-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = { 'xclip', '-selection', 'clipboard' },
    ['*'] = { 'xclip', '-selection', 'primary' },
  },
  paste = {
    ['+'] = { 'xclip', '-selection', 'clipboard', '-o' },
    ['*'] = { 'xclip', '-selection', 'primary', '-o' },
  },
  cache_enabled = true,
}
vim.api.nvim_set_keymap('n', '<A-Up>', ':m .-1<CR>==', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })

require "lazy_setup"
require "polish"

require'lspconfig'.pyright.setup{
  settings = {
    python = {
      pythonPath = vim.fn.getcwd() .. "/backend/venv/bin/python"  
    },
  },
  root_dir = function()
    return vim.fn.getcwd()  
  end,
}
