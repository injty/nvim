return {
  "stevearc/conform.nvim",
  opts = {
formatters_by_ft = {
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      json = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      vue = { "prettier" },
    },
    format_on_save = function(bufnr)
      local has_prettierrc = vim.fs.find(".prettierrc.json", {
        upward = true,
        path = vim.fs.dirname(vim.api.nvim_buf_get_name(bufnr)),
        stop = vim.loop.os_homedir(),
      })[1] ~= nil

      return has_prettierrc and { timeout_ms = 500, lsp_fallback = true } or nil
    end,
  },
}
