-- Git
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			vim.keymap.set("n", "<Leader>gb", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame" })
			vim.keymap.set("n", "<Leader>gd", gs.diffthis, { buffer = bufnr, desc = "Git diff" })
		end,
	},
}
