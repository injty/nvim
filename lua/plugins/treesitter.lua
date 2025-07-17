-- Treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "javascript", "typescript", "tsx", "vue", "html", "css", "json", "yaml", "prisma" },
			highlight = { enable = true },
			incremental_selection = { enable = true },
			textobjects = { enable = true },
		})
	end,
}
