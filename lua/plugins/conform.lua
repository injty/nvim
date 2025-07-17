return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			javascriptreact = { "prettier" },
			vue = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
		},
		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},
	},
	keys = {
		{
			"<Leader>fp",
			function()
				require("conform").format({ timeout_ms = 2000, lsp_fallback = true })
			end,
			desc = "Format buffer",
		},
	},
}
