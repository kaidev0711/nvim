local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt
local o = vim.o
g.mapleader = ' '


cmd('filetype plugin indent on')
cmd('syntax enable')

opt.fileencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileformat = 'unix'
opt.colorcolumn = '111'
opt.termguicolors = true
opt.history = 100
opt.number = true
opt.numberwidth = 2
opt.relativenumber = false
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.hidden = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.lazyredraw = true
opt.updatetime = 300
opt.timeoutlen = 500
-- opt.wildmenu = true
opt.background = 'dark'
opt.autoindent = true
opt.tabstop = 4
opt.wrap = false
opt.swapfile = false
opt.laststatus = 2
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.backspace = 'indent,eol,start'
opt.ruler = true
opt.backup = false
opt.writebackup = false
opt.confirm = true
-- o.noma = true
o.showcmd = false 
o.smartindent = true 
o.shortmess = o.shortmess .. 'c'
o.whichwrap = 'b,s,<,>,[,],h,l'
opt.guifont = "Hack Nerd Font Mono:h21"
-- vim.cmd[[set modifiable]]
