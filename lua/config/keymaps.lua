local g = vim.g
local k = vim.keymap

-- Настройка leader-keys
g.mapleader = ' '

k.set('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true }) -- Сохранить файл
k.set('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true }) -- Выйти

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
k.set('n', '<Leader>ww', '<C-w>w', { desc = 'cycle windows' })
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
k.set('n', '<Leader>h', '0', { desc = 'start of line' })
k.set('n', '<Leader>l', '$', { desc = 'end of line' })

-- Telescope
local builtin = require('telescope.builtin')
k.set('n', '<Leader>ff', builtin.find_files, {})
k.set('n', '<Leader>fg', builtin.live_grep, {})
k.set('n', '<Leader>fb', builtin.buffers, {})
k.set('n', '<Leader>fh', builtin.help_tags, {})
k.set('n', '<Leader>fd', builtin.diagnostics, {})
k.set('n', '<Leader>fo', builtin.oldfiles, {})

-- nvim-tree
k.set('n', '<Leader>;', '<cmd>NvimTreeToggle<CR>', { desc = 'toggle nvim tree explorer' })

-- LSP
k.set('n', '<Leader>gd', '<cmd>Telescope lsp_definitions<CR>', { desc = "go to definition" })
k.set('n', '<Leader>gr', '<cmd>Telescope lsp_references<CR>', { desc = "find references" })
k.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { desc = "show documentation" })
k.set('n', '<Leader>ca', '<cmd>Lspsaga code_action<CR>', { desc = "code action" })
k.set('n', '<Leader>rn', '<cmd>Lspsaga rename<CR>', { desc = "rename" })
k.set('n', '<Leader>mdn', ':MDN<CR>', { desc = "open mdn for word under cursor" })
k.set('n', '<Leader>fmt', ':Format<CR>', { desc = "format file" })

-- Другие команды
k.set('n', 'Esc', ':noh<CR>', { noremap = true, silent = true })
