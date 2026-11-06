return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	dependencies = { "mason-org/mason.nvim" },
	init = function()
		vim.api.nvim_create_user_command("Format", function()
			require("conform").format({ async = false, timeout_ms = 2000, lsp_format = "never" })
		end, { desc = "Format current buffer" })
	end,
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			less = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			["markdown.mdx"] = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
		},
		-- Prettier предпочитает node_modules проекта (prettier.cmd на Windows).
		-- Mason служит запасным вариантом.
		format_on_save = function(bufnr)
			if vim.bo[bufnr].buftype ~= "" or vim.b[bufnr].autoformat == false or vim.g.autoformat == false then
				return
			end
			return { timeout_ms = 2000, lsp_format = "never" }
		end,
	},
}
