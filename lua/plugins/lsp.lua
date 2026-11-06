return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "mason-org/mason.nvim", "saghen/blink.cmp" },
	config = function()
		vim.diagnostic.config({ float = { border = "single" }, severity_sort = true })

		-- Сохраняем on_attach самих серверов (например, ESLint FixAll).
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("FrontendLsp", { clear = true }),
			callback = function(event)
				local function map(keys, action, desc)
					vim.keymap.set("n", keys, action, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				local function picker(name)
					return function()
						require("telescope.builtin")[name]()
					end
				end
				map("<leader>rn", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				map("gd", vim.lsp.buf.definition, "Goto definition")
				map("gr", picker("lsp_references"), "References")
				map("gI", vim.lsp.buf.implementation, "Goto implementation")
				map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
				map("<leader>ds", picker("lsp_document_symbols"), "Document symbols")
				map("<leader>ws", picker("lsp_dynamic_workspace_symbols"), "Workspace symbols")
				map("gh", vim.lsp.buf.hover, "Hover documentation")
				map("<C-k>", vim.lsp.buf.signature_help, "Signature documentation")
				for _, key in ipairs({ "<C-S-j>", "]d" }) do
					map(key, function()
						vim.diagnostic.jump({ count = 1, float = true })
					end, "Next diagnostic")
				end
				for _, key in ipairs({ "<C-S-k>", "[d" }) do
					map(key, function()
						vim.diagnostic.jump({ count = -1, float = true })
					end, "Previous diagnostic")
				end
				map("gD", vim.lsp.buf.declaration, "Goto declaration")
				map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
				map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
				map("<leader>wl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, "List workspace folders")
			end,
		})

		vim.lsp.config("*", { capabilities = require("blink.cmp").get_lsp_capabilities() })
		vim.lsp.config("vtsls", {
			filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
			settings = {
				vtsls = {
					autoUseWorkspaceTsdk = true,
					tsserver = {
						globalPlugins = {
							{
								name = "@vue/typescript-plugin",
								location = vim.fs.joinpath(
									vim.fn.stdpath("data"),
									"mason/packages/vue-language-server/node_modules/@vue/language-server"
								),
								languages = { "vue" },
								configNamespace = "typescript",
								enableForWorkspaceTypeScriptVersions = true,
							},
						},
					},
				},
			},
		})
		vim.lsp.config("eslint", {
			settings = { format = false, workingDirectory = { mode = "auto" } },
		})
		vim.lsp.config("tailwindcss", {
			-- Не запускаем Tailwind только из-за .git в обычном JS-проекте.
			root_dir = function(bufnr, on_dir)
				local filename = vim.fs.normalize(vim.api.nvim_buf_get_name(bufnr))
				local marker = vim.fs.find(function(name, path)
					if name:match("^tailwind%.config%.[cm]?[jt]s$") then
						return true
					end
					if name ~= "package.json" then
						return false
					end
					local ok, pkg = pcall(function()
						return vim.json.decode(table.concat(vim.fn.readfile(vim.fs.joinpath(path, name)), "\n"))
					end)
					if not ok or type(pkg) ~= "table" then
						return false
					end
					for _, field in ipairs({ "dependencies", "devDependencies", "peerDependencies" }) do
						local deps = pkg[field]
						if type(deps) == "table" and deps.tailwindcss then
							return true
						end
					end
					return false
				end, { path = vim.fs.dirname(filename), upward = true, type = "file" })[1]
				if marker then
					on_dir(vim.fs.dirname(marker))
				end
			end,
			settings = { tailwindCSS = { classFunctions = { "clsx", "cn", "cva", "tw" } } },
		})
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
					telemetry = { enable = false },
				},
			},
		})

		-- Старые пакеты Mason не включаются автоматически.
		require("mason-lspconfig").setup({ automatic_enable = false })
		vim.lsp.enable(require("tooling").servers)
	end,
}
