local keymap = vim.keymap

-- remove ctrl-z for windows
keymap.set('n', '<C-z>', '<Nop>')

-- remove yank with x
keymap.set('n', 'x', '"_x')

-- increment and decriment
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- delete a previous word
keymap.set('n', 'dw', 'vb"_d')

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- tabs
keymap.set('n', '<Tab>', ':tabnext<CR>')
keymap.set('n', '<S-Tab>', ':tabprevious<CR>')
keymap.set('n', 'te', ':tabedit<CR>', { silent = true })

-- windows split
keymap.set('n', 'ss', ':split<CR><C-w>w')
keymap.set('n', 'sv', ':vsplit<CR><C-w>w')

-- line coordination
keymap.set('n', '<Space>h', '0')
keymap.set('n', '<Space>l', '$')

-- files
keymap.set('n', 'sf', ':Files')

-- prettier
