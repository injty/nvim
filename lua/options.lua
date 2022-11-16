vim.cmd('autocmd!')
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

vim.opt.title = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 20

vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.background = 'dark'

vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.ai = true
vim.opt.si = true
vim.opt.breakindent = true
vim.opt.hlsearch = true
vim.opt.backspace = 'start,eol,indent'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.clipboard = 'unnamedplus'
vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
