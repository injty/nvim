return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",     -- Источник: подсказки от LSP
    "hrsh7th/cmp-buffer",       -- Источник: слова из текущего файла
    "hrsh7th/cmp-path",         -- Источник: пути в файловой системе
    "saadparwaiz1/cmp_luasnip", -- Источник: готовые сниппеты кода
    "onsails/lspkind.nvim",     -- Утилита: добавляет красивые VS Code-like иконки в меню подсказок
  },
  opts = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    lspkind.init({
      preset = "codicons",
    })

    return {
      window = {
        completion = {
          -- Стилизация внешнего вида окна автодополнения (границы, фоны)
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3, -- Смещение окна подсказок по горизонтали для лучшего выравнивания
          side_padding = 0, -- Отступы по бокам внутри окна подсказок
        },
      },
      completion = {
        -- Настройка поведения меню: 
        -- menu (показывать меню), menuone (показывать, даже если доступен всего 1 вариант), noinsert (не вставлять текст автоматически, пока сам не выберешь)
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        -- Объясняем nvim-cmp, какой движок сниппетов использовать для разворачивания конструкций
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      -- [ГОРЯЧИЕ КЛАВИШИ внутри меню дополнений]:
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- Прокрутка документации к методу вверх
        ["<C-f>"] = cmp.mapping.scroll_docs(4),  -- Прокрутка документации к методу вниз
        ["<C-Space>"] = cmp.mapping.complete(),  -- Принудительно вызвать окно автодополнения
        ["<C-e>"] = cmp.mapping.abort(),         -- Закрыть окно автодополнения, если оно мешает

        -- При нажатии на Enter (<CR>) подтверждается текущий выбранный элемент.
        -- select = true означает, что если ты ничего не выбрал стрелочками, то автоматически применится самый первый (верхний) вариант.
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      -- [ИСТОЧНИКИ]: откуда брать подсказки и в каком приоритете
      sources = cmp.config.sources({
        { name = "nvim_lsp" },                   -- 1. Самый высокий приоритет — умный код от LSP
        { name = "luasnip" },                    -- 2. Сниппеты шаблонов кода
        { name = "buffer", keyword_length = 4 }, -- 3. Слова из файла (начнет подсказывать только от 4-х введённых символов)
        { name = "path" },                       -- 4. Пути к файлам папок
      }),

      -- [КАСТОМИЗАЦИЯ ДИЗАЙНА]: делает выпадающее меню эстетичным и минималистичным
      formatting = {
        -- Порядок столбцов в меню: сначала иконка типа (kind), затем сам текст (abbr), в конце — описание (menu)
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          -- Магия разбиения строк, чтобы превратить дефолтные подсказки в красивые отформатированные блоки с пробелами вокруг иконок
          local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = " " .. (strings[2] or "") .. ""
          return kind
        end,
      },
      experimental = {
        -- Нереально удобная фича: показывает серый «текст-призрак» прямо в коде, 
        -- визуализируя то, что вставится, если ты прямо сейчас нажмешь Enter.
        ghost_text = true,
      },
    }
  end,
}
