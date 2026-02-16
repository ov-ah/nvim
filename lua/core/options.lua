local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Undo / backup
opt.undofile = true
opt.swapfile = false
opt.backup = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Misc
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.showmode = false
opt.completeopt = { "menuone", "noselect" }
