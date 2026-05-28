return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
	main = "ibl",
	opts = {
		-- Настройка самого символа линий отступа
		indent = {
			char = "│",
		},
		-- Настройка исключений (где НЕ показывать линии)
		exclude = {
			buftypes = { "terminal", "nofile" },
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"neo-tree",
				"Trouble",
			},
		},
		-- Настройка подсветки текущего контекста (активной области видимости)
		scope = {
			enabled = true, -- Заменяет show_current_context = true
			show_start = false,
			show_end = false,
		},
	},
}
