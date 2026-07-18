-- ./init.lua
-- 1. vim.loader
-- 2. lua/config/*
-- 3. plugin/*.lua
-- 4. after/*

vim.loader.enable()

-- disabling unused providers
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.laoded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- install hooks must register before the first vim.pack.add()
require('config.hooks')

require('config.options')
require('config.diagnostics')
require('config.keymaps')
require('config.autocmds')

