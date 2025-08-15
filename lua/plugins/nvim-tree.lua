return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- иконки

  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    })

    -- Горячие клавиши
    vim.keymap.set("n", "<leader>;", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
  end,
}
