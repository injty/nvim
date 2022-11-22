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
keymap.set('n', 'ss', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })

-- windows navigation
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<right>', '<C-w>l')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sl', '<C-w>l')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')


-- windows resize
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- line coordination
keymap.set('n', '<Space>h', '0')
keymap.set('n', '<Space>l', '$')

-- files
keymap.set('n', 'sf', ':Ex<CR>')

-- fzf
keymap.set('n', 'fr', ':History<CR>', {noremap = true})
keymap.set('n', 'ff', ':e %:h/<C-d>', {noremap = true})

-- prettier
