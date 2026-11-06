-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Terminal mode keymaps
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], opts)
    vim.keymap.set("t", "<c-w><c-w>", [[<cmd>wincmd w<cr>]], opts)
  end,
})
