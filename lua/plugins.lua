require("lazy").setup({
  { "folke/which-key.nvim", opts = {} },
  { "craftzdog/solarized-osaka.nvim", lazy = false, priority = 1000, opts = {} },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" }},
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", cmd = "Telescope", dependencies = { "nvim-lua/plenary.nvim" }},
  { "neovim/nvim-lspconfig",
    config = function()
      require'lspconfig'.ts_ls.setup{}
      end
  }
})

local theme = "solarized-osaka"
vim.cmd("colorscheme " .. theme)

require("lualine").setup({
  options = {
    -- theme = vim.g.colors_name,
    theme = "solarized"
  }
})

