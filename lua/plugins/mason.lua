return {
	"mason-org/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate", "MasonLog" },
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		local tooling = require("tooling")
		require("mason-tool-installer").setup({
			ensure_installed = vim.list_extend(vim.deepcopy(tooling.servers), tooling.formatters),
			auto_update = false,
			start_delay = 3000,
			integrations = {
				["mason-lspconfig"] = true,
				["mason-null-ls"] = false,
				["mason-nvim-dap"] = false,
			},
		})
		if vim.v.vim_did_enter == 1 then
			require("mason-tool-installer").run_on_start()
		end
	end,
}
