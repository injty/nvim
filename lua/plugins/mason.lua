local M = {
  "williamboman/mason.nvim",
}

M.dependencies = {
  { "williamboman/mason-lspconfig.nvim" },
  { "jay-babu/mason-null-ls.nvim" },
}

M.servers = {
  "astro",
  "clangd",
  "rust_analyzer",
  "pyright",
  "ts_ls",
  "lua_ls",
  "clojure_lsp",
  "bashls",
  "yamlls",
  "marksman",
  "html",
  "cssls",
}

-- [ ОПТИМИЗИРОВАНО ]: Оставили только то, что реально есть в реестре Mason
M.tools = {
  "stylua",
  "black",
  "prettierd",
  "eslint_d",
}

M.config = function()
  require("mason").setup()

  require("mason-lspconfig").setup({
    ensure_installed = M.servers,
  })

  require("mason-null-ls").setup({
    ensure_installed = M.tools,
    automatic_installation = true,
  })
end

return M
