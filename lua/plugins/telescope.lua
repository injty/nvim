return {
	-- Поиск
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		cmd = "Telescope",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			defaults = {
				file_ignore_patterns = { "node_modules/", ".git/" },
			},
		},
		keys = {
			{ "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<Leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
			{ "<Leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<Leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
			{ "<Leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
			{ "<Leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
		},
	},
}
