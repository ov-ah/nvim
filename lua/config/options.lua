-- since 0.11 'vim.o' accepts lua so we use it everywhere

local o = vim.o

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- ui
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.termguicolors = true
o.winborder = 'rounded'
o.pumborder = 'rounded'
o.pummaxwidth = 60
o.pumheight = 12
o.laststatus = 3
o.showmode = false
o.smoothscroll = true
o.splitkeep = 'screen'
o.splitbelow = true
o.splitright = true
o.scrolloff = 8
o.sidescrolloff = 8
o.list = true
o.listchars = { tab = '│ ', trail = '·', nbsp = '␣', extends = '›', precedes = '‹' }
o.fillchars = { eob = ' ', fold = ' ', foldopen = '', foldclose = '', diff = '╱' }
o.shortmess = vim.o.shortmess .. 'WcC'

-- editing
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
o.wrap = false
o.linebreak = true
o.undofile = true
o.swapfile = false
o.updatetime = 200
o.timeoutlen = 400
o.confirm = true
o.virtualedit = 'block'
o.jumpoptions = 'stack,view'

-- search & replace
o.ignorecase = true
o.smartcase = true
o.inccommand = 'split'
o.grepprg = 'rg --vimgrep --smart-case'
o.grepformat = '%f:%l:%c:%m'

-- completion, native 0.12
o.autocomplete = true
o.completeopt = 'menu,menuone,noselect,popup,fuzzy,nearest'
o.complete = '.^5,w^3,b^3,u^3,o' 
o.wildmode = 'longest:full,full'
o.wildoptions = 'pum,fuzzy'

-- folds
o.foldmethod = 'expr'
o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
o.foldtext = '' -- keep syntax highlighting
o.foldelevel = 99
o.foldlevelstart =99
o.foldcolumn = '0'

--files
o.exrc = true
o.autoread = true
o.backup = false
o.writebackup = false
o.sessionoptions = 'buffers,curdir,folds,help,tabpages,winsize,terminal'
o.clipboard = '' -- not unnamedplus; see <leader>y
o.diffopt = vim.o.diffopt .. ',linematch:60'
