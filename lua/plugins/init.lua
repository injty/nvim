return {
	{
		"tpope/vim-sleuth",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			{ "JoosepAlviste/nvim-ts-context-commentstring", opts = { enable_autocmd = false } },
		},
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		keys = { { "<C-t>", "<cmd>ToggleTerm<cr>", mode = { "n", "i", "t" }, desc = "Toggle terminal" } },
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-t>]],
				shade_terminals = false,
			})
		end,
	},
	{
		"nvim-mini/mini.nvim",
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.bracketed").setup()
			require("mini.move").setup()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},
}
