return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"lua",
			"luadoc",
			"javascript",
			"typescript",
			"tsx",
			"vue",
			"html",
			"css",
			"scss",
			"json",
			"json5",
			"yaml",
			"markdown",
			"markdown_inline",
			"graphql",
			"regex",
			"bash",
			"diff",
			"vim",
			"vimdoc",
		}
		vim.treesitter.language.register("json5", "jsonc")
		require("nvim-treesitter").install(parsers, { max_jobs = 2 })
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("FrontendTreesitter", { clear = true }),
			callback = function(event)
				if vim.bo[event.buf].buftype ~= "" then
					return
				end
				local size = vim.uv.fs_stat(vim.api.nvim_buf_get_name(event.buf))
				if size and size.size > 1024 * 1024 then
					return
				end
				-- Во время первой установки парсер может быть ещё недоступен.
				pcall(vim.treesitter.start, event.buf)
			end,
		})
	end,
}
