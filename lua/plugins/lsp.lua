local M = {
	"neovim/nvim-lspconfig",
	-- Плагин загружается в фоне, как только Neovim начинает читать буфер файла
	event = "BufReadPre",
}

M.dependencies = {
	{ "hrsh7th/cmp-nvim-lsp" }, -- Интеграция LSP с окном автодополнения
	{ "j-hui/fidget.nvim" }, -- Красивый индикатор загрузки LSP серверов в правом нижнем углу
	"mason.nvim", -- Твой менеджер пакетов
	"williamboman/mason-lspconfig.nvim", -- Мост между Mason и lspconfig
}

M.config = function()
	require("plugins.mason")
	-- Вытягиваем список серверов из конфига mason.lua
	local servers = require("plugins.mason").servers

	-- Функция on_attach вызывается каждый раз, когда к открытому файлу успешно подключается LSP сервер.
	-- Она прокидывает горячие клавиши локально, прямо в буфер (bufnr) этого файла.
	local on_attach = function(client, bufnr)
		local nmap = function(keys, func, desc)
			if desc then
				desc = "LSP: " .. desc
			end

			-- Создаем бинды только для Normal режима ('n'), привязывая их к конкретному буферу
			vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
		end

		-- [РЕФАКТОРИНГ]: Умное переименование переменной/функции по всему проекту
		nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		-- [БЫСТРЫЕ ИСПРАВЛЕНИЯ]: Вызов контекстных действий (импорты, квик-фиксы от линтеров)
		nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

		-- [НАВИГАЦИЯ]: Прыжок к месту, где функция/переменная была объявлена (база)
		nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		-- [ПОИСК]: Показывает через Telescope все места, где используется этот символ в коде
		nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		-- [НАВИГАЦИЯ]: Прыжок к реализации интерфейса (актуально для TS/классов)
		nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
		-- [НАВИГАЦИЯ]: Прыжок к объявлению типа переменной
		nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
		-- [ПОИСК]: Список всех функций, переменных и классов внутри текущего файла через Telescope
		nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		-- [ПОИСК]: Глобальный поиск символов по всему проекту
		nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

		-- [ИНСПЕКЦИЯ]: Показывает документацию и типы данных при наведении курсора на слово
		nmap("gh", vim.lsp.buf.hover, "Hover Documentation")
		-- [ИНСПЕКЦИЯ]: Показывает подсказку по аргументам функции прямо внутри круглых скобок
		nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

		-- Более редкие функции LSP (работа с воркспейсами и прыжок к декларации)
		nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
		nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
		nmap("<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, "[W]orkspace [L]ist Folders")

		-- Создает кастомную команду `:Format` для текущего файла
		vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
			if vim.lsp.buf.format then
				vim.lsp.buf.format()
			elseif vim.lsp.buf.formatting then
				vim.lsp.buf.formatting()
			end
		end, { desc = "Format current buffer with LSP" })
	end

	-- Включаем индикатор статуса серверов (в углу будет видно анимацию, когда сервак думает)
	require("fidget").setup()

	-- Подготовка путей, чтобы Neovim понимал структуру файлов Lua при редактировании своего конфига
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	-- Настройка «возможностей» (capabilities). Передаем серверам информацию о том,
	-- что наш клиент Neovim поддерживает автодополнение от nvim-cmp и сворачивание кода (folding).
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	-- Автоматический цикл инициализации для всех серверов, которые ты перечислил в файле mason.lua
	for _, lsp in ipairs(servers) do
		local config = {
			on_attach = function(client, bufnr)
				-- Отключаем форматирование у встроенного ts_ls, чтобы он не конфликтовал с Prettier
				if client.name == "ts_ls" then
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end
				on_attach(client, bufnr)
			end,
			capabilities = capabilities,
		}

		if vim.lsp.config then
			vim.lsp.config(lsp, config)
		else
			require("lspconfig")[lsp].setup(config)
		end
	end

	-- Отдельная глубокая настройка для сервера lua_ls (чтобы он не спамил предупреждениями, что не знает объект 'vim')
	local lua_settings = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = runtime_path,
				},
				diagnostics = {
					globals = { "vim" }, -- Говорим серверу: "vim — это глобальный объект, всё в порядке"
				},
				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
				telemetry = { enable = false },
			},
		},
	}

	if vim.lsp.config then
		vim.lsp.config("lua_ls", lua_settings)
	else
		require("lspconfig").lua_ls.setup(lua_settings)
	end

	-- Автоматическое форматирование кода при каждом сохранении файла (через команду :w)
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			-- async = false блокирует буфер на долю секунды, гарантируя, что файл запишется на диск УЖЕ отформатированным
			vim.lsp.buf.format({ async = false })
		end,
	})
end

return M
