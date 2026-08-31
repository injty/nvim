local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

-- Загрузка базовых настроек Neovim
require("options")

-- Инициализация менеджера плагинов
require("lazy").setup("plugins", {
	defaults = { lazy = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- Быстрый доступ к меню Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")

-- Отложенная загрузка автокоманд и маппингов для быстрой работы Neovim
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("autocommands")
		require("keymaps")
	end,
})

-- disabled italic fonts
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl_groups = vim.api.nvim_get_hl(0, {})
		for hl_name, hl_attrs in pairs(hl_groups) do
			if hl_attrs.italic then
				hl_attrs.italic = false
				vim.api.nvim_set_hl(0, hl_name, hl_attrs)
			end
		end
	end,
})
