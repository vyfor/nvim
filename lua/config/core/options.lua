local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.maplocalleader = '\\'
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

opt.foldlevel = 99
opt.scrolloff = 4
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 0
opt.fileencoding = 'utf-8'
opt.lazyredraw = false
opt.swapfile = false
opt.undofile = true
opt.updatetime = 100
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = 'screen'

opt.autoindent = true
opt.breakindent = true
opt.cindent = true
opt.expandtab = true
opt.shiftround = true
opt.shiftwidth = 2
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 2
opt.tabstop = 2

opt.hlsearch = false
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true

opt.shell = 'nu'
opt.shellcmdflag = '-c'
opt.shellquote = ''
opt.shellredir = '| save %s'
opt.shellxquote = ''

opt.termguicolors = true

opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true
opt.showmode = false
opt.wrap = false
opt.list = true
opt.smoothscroll = true
opt.foldmethod = 'expr'
opt.foldtext = ''
opt.laststatus = 3
