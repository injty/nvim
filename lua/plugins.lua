require("lazy").setup({
  {"ThePrimeagen/vim-be-good"},
  {"folke/which-key.nvim", opts = {}},

  {"ellisonleao/gruvbox.nvim", priority = 1000, opts = {
    terminal_colors = true,
    contrast = "hard",
    italic = { comments = true },
    inverse = true
  }},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {"nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }},

  {"nvim-telescope/telescope.nvim", tag = "0.1.6", cmd = "Telescope", dependencies = { "nvim-lua/plenary.nvim" }}
})

local theme = "catppuccin"
vim.cmd("colorscheme " .. theme)

require("lualine").setup({
  options = {
    theme = vim.g.colors_name,
  }
})

