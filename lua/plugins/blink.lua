return {
	"saghen/blink.cmp",
	version = "1.*",
	event = "InsertEnter",
	dependencies = { "rafamadriz/friendly-snippets" },
	opts = {
		-- Lua matcher одинаково работает на Windows и macOS без сборки Rust.
		fuzzy = { implementation = "lua" },
		keymap = {
			preset = "none",
			["<C-k>"] = { "show", "fallback" },
			["<C-e>"] = { "cancel", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-y>"] = { "accept", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<C-n>"] = {
				function(cmp)
					return cmp.select_next({ auto_insert = true })
				end,
				"show",
				"fallback",
			},
			["<C-p>"] = {
				function(cmp)
					return cmp.select_prev({ auto_insert = true })
				end,
				"show",
				"fallback",
			},
			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},
		completion = {
			list = { selection = { preselect = true, auto_insert = false } },
			accept = { auto_brackets = { enabled = false } },
			menu = { border = "single" },
			documentation = { auto_show = true, window = { border = "single" } },
			ghost_text = { enabled = true },
		},
		sources = {
			default = { "lsp", "snippets", "path", "buffer" },
			providers = {
				buffer = {
					min_keyword_length = 4,
					opts = {
						get_bufnrs = function()
							return { vim.api.nvim_get_current_buf() }
						end,
					},
				},
			},
		},
		cmdline = { enabled = false },
	},
}
