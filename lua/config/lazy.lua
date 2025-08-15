require("lazy").setup({
	-- Imports
	{ import = "plugins.conform" },
	{ import = "plugins.gitsigns" },
	{ import = "plugins.lsp" },
	{ import = "plugins.lualine" },
  { import = "plugins.bufferline" },
	{ import = "plugins.nvim-cmp" },
	{ import = "plugins.nvim-tree" },
	{ import = "plugins.telescope" },
	{ import = "plugins.theme" },
	{ import = "plugins.treesitter" },

	-- Подсказки для горячих клавиш
	{ "folke/which-key.nvim", opts = {} },

	-- Автозакрытие тегов
	{
		"windwp/nvim-ts-autotag",
		opts = {
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
		},
	},

	-- Сниппеты
	{
		"rafamadriz/friendly-snippets",
	},
},

{
	performance = {
		rtp = {
			disabled_plugins = { "netrw", "netrwPlugin" },
		},
	},
})
