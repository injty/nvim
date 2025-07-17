return {
	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				settings = {
					typescript = {
						inlayHints = { includeInlayParameterNameHints = false },
					},
				},
			})
		end,
	},

	-- UI надстройка LSP (Lspsaga)
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("lspsaga").setup({
				lightbulb = { enable = false },
			})
		end,
	},

	-- Автодополнение
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping.select_next_item(),
					["<S-Tab>"] = cmp.mapping.select_prev_item(),
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			})
		end,
	},
}
