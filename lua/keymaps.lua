local g = vim.g
local k = vim.keymap

g.mapleader = ' '

-- remove ctrl-z for windows
k.set('n', '<C-z>', '<Nop>')

-- remove yank with x
k.set('n', 'x', '"_x')

-- increment and decriment
k.set('n', '+', '<C-a>')
k.set('n', '-', '<C-x>')

-- delete a previous word
k.set('n', 'dw', 'vb"_d')

-- select all
k.set('n', '<C-a>', 'gg<S-v>G')

-- tabs
k.set('n', '<Tab>', ':tabnext<CR>')
k.set('n', '<S-Tab>', ':tabprevious<CR>')
k.set('n', 'te', ':tabedit<CR>', { silent = true })

-- windows split
k.set('n', 'sg', ':split<CR><C-w>w', { silent = true })
k.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })

-- windows navigation
k.set('n', '<Space>', '<C-w>w')
k.set('', 's<left>', '<C-w>h')
k.set('', 's<right>', '<C-w>l')
k.set('', 's<up>', '<C-w>k')
k.set('', 's<down>', '<C-w>j')
k.set('', 'sh', '<C-w>h')
k.set('', 'sl', '<C-w>l')
k.set('', 'sk', '<C-w>k')
k.set('', 'sj', '<C-w>j')


-- windows resize
k.set('n', '<C-w><left>', '<C-w><')
k.set('n', '<C-w><right>', '<C-w>>')
k.set('n', '<C-w><up>', '<C-w>+')
k.set('n', '<C-w><down>', '<C-w>-')

-- line coordination
k.set('n', '<Space>h', '0')
k.set('n', '<Space>l', '$')

-- prettier
