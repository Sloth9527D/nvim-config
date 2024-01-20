vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.cursorline = true
vim.wo.colorcolumn = 120
vim.wo.number = true
vim.o.showmode = false
vim.o.termguicolors = true
-- -- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space:·"
-- vim.o.cmdheight = 2

vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

vim.o.backspace='indent,eol,start'
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false
vim.o.autoread = true

vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.timeoutlen = 300

vim.o.pumheight = 10
vim.o.completeopt = "menu,menuone,noselect,noinsert"
vim.o.wildmenu = true  --补全增强