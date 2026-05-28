local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
}

M.config = function()
  local nls = require("null-ls")

  nls.setup({
    debounce = 150,
    save_after_format = false,
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.black,
      nls.builtins.formatting.prettierd.with({
        extra_filetypes = { "astro" },
      }),

      require("none-ls.diagnostics.eslint_d"),
    },
    root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", ".git"),
  })
end

M.has_formatter = function(ft)
  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")
  return #available > 0
end

return M
