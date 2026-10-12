return {
	{
		"tpope/vim-sleuth",
		event = "BufReadPre",
	},
	{
		"numToStr/Comment.nvim",
		event = "BufReadPost",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"Olical/conjure",
		ft = "clojure",
	},
	{
		"max397574/better-escape.nvim",
		event = "VeryLazy",
		config = function()
			require("better_escape").setup()
		end,
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-t>]],
				shade_terminals = false,
			})
		end,
	},
	{
		"echasnovski/mini.nvim",
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
