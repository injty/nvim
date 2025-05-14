local o = vim.opt

o.mouse = "a"
o.mousescroll = "ver:5,hor:5"
o.mousemoveevent = true

o.showcmd = true
o.showtabline = 1
o.cmdheight = 1
o.laststatus = 2

o.signcolumn = "auto:2"
o.title = true
o.number = true
o.relativenumber = true
o.wrap = false
o.scrolloff = 8

o.termguicolors = true
o.winblend = 0
o.wildoptions = 'pum'
o.pumblend = 5
o.cursorline = true
o.listchars = "tab:▸-,trail:·,nbsp:◇,space:·"
o.list = true
o.background = 'dark'

o.smarttab = true
o.expandtab = true
o.tabstop = 2
o.vartabstop = "2"
o.softtabstop = 2
o.shiftwidth = 2
o.ai = true
o.si = true
o.breakindent = true
o.hlsearch = true
o.backspace = 'start,eol,indent'

o.swapfile = true
o.directory = vim.fn.stdpath('data') .. "/swap//"
o.inccommand = 'split'
o.ignorecase = true

o.fileencoding = 'utf-8'
o.clipboard = 'unnamedplus'
-- o.wildignore = { '*/node_modules/*', '*.git/*' }
o.wildignore = vim.list_extend(vim.opt.wildignore:get(), { '*/node_modules/*', '*.git/*' })

o.undofile = true

o.updatetime = 250

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.opt_local.wrap = true
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'python' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end
})
