local g = vim.g
local k = vim.keymap

-- Настройка leader-keys
g.mapleader = ' '

-- Отключение Ctrl-z для Windows
k.set('n', '<C-z>', '<Nop>')

-- Удаление "yank" с помощью x
k.set('n', 'x', '"_x')

-- Инкремент и декремент
k.set('n', '+', '<C-a>')
k.set('n', '-', '<C-x>')

-- Удалить предыдущее слово
k.set('n', 'dw', 'vb"_d')

-- Выделение всего
k.set('n', '<C-a>', 'gg<S-v>G')

-- Табуляция
k.set('n', '<Tab>', ':tabnext<CR>')
k.set('n', '<S-Tab>', ':tabprevious<CR>')
k.set('n', 'te', ':tabedit<CR>', { silent = true })

-- Окна и разделение
k.set('n', 'sg', ':split<CR><C-w>w', { silent = true })
k.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })

-- Навигация по окнам
k.set('n', '<Space>', '<C-w>w')
k.set('', 's<left>', '<C-w>h')
k.set('', 's<right>', '<C-w>l')
k.set('', 's<up>', '<C-w>k')
k.set('', 's<down>', '<C-w>j')
k.set('', 'sh', '<C-w>h')
k.set('', 'sl', '<C-w>l')
k.set('', 'sk', '<C-w>k')
k.set('', 'sj', '<C-w>j')

-- Изменение размера окон
k.set('n', '<C-w><left>', ':vertical resize -2<CR>')
k.set('n', '<C-w><right>', ':vertical resize +2<CR>')
k.set('n', '<C-w><up>', ':resize +2<CR>')
k.set('n', '<C-w><down>', ':resize -2<CR>')

-- Координация строк
k.set('n', '<Space>h', '0')
k.set('n', '<Space>l', '$')

-- Telescope
local builtin = require('telescope.builtin')
k.set('n', '<leader>ff', builtin.find_files, {})
k.set('n', '<leader>fg', builtin.live_grep, {})
k.set('n', '<leader>fb', builtin.buffers, {})
k.set('n', '<leader>fh', builtin.help_tags, {})
k.set('n', '<leader>fd', builtin.diagnostics, {})
k.set('n', '<leader>fo', builtin.oldfiles, {})

-- Другие команды
vim.api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', { noremap = true, silent = true })
