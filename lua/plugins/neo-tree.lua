return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{ "<leader>n", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree (root dir)", remap = true },
			{
				"<leader>e",
				function()
					if vim.bo.filetype == "neo-tree" then
						vim.cmd("wincmd p")
					else
						vim.cmd("Neotree focus")
					end
				end,
				desc = "Toggle Focus NeoTree",
				remap = true,
			},
		},
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,

		config = function()
			require("neo-tree").setup({
				window = {
					position = "right",
					width = 50,
					mappings = {
						["c"] = "close_all_nodes",
						["h"] = "toggle_hidden",
					},
				},
				filesystem = {
					follow_current_file = {
						enabled = true,
					},
				},
			})
		end,
	},
}
