return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	opts = { no_italic = true },
	config = function(_, opts)
		require("catppuccin").setup(opts)
	end,
}
