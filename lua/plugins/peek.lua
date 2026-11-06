return {
	"toppair/peek.nvim",
	build = function(plugin)
		if vim.fn.executable("deno") == 0 then
			return
		end
		local result = vim.system({ "deno", "task", "--quiet", "build:fast" }, { cwd = plugin.dir, text = true }):wait()
		if result.code ~= 0 then
			error(result.stderr)
		end
	end,
	keys = {
		{
			"<leader>op",
			function()
				if vim.fn.executable("deno") == 0 then
					vim.notify("Peek: install Deno, then run :Lazy build peek.nvim", vim.log.levels.WARN)
					return
				end
				local peek = require("peek")
				if peek.is_open() then
					peek.close()
				else
					peek.open()
				end
			end,
			desc = "Peek (Markdown Preview)",
		},
	},
	opts = {
		theme = "light", -- 'dark' or 'light'
	},
}
