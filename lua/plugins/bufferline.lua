return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        separator_style = "slant", -- или "thick", "thin", "slope", и т.д.
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })

    -- Горячие клавиши для навигации по буферам (вкладкам)
  vim.keymap.set("n", "<C-M-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab (Ctrl+Alt+L)" })
  vim.keymap.set("n", "<C-M-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab (Ctrl+Alt+H)" })
  end,
}
