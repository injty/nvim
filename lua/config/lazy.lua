
require("lazy").setup({
  -- Подсказки для горячих клавиш
  { "folke/which-key.nvim", opts = {} },

  -- Тема
  {
    "EdenEast/nightfox.nvim"
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
    },
  },

  -- Статусная строка
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
      },
    },
  },

  -- Поиск
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules/", ".git/" },
      },
    },
    keys = {
      { "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
      { "<Leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
      { "<Leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
      { "<Leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags" },
      { "<Leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Diagnostics" },
      { "<Leader>fo", "<cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "tsx", "vue", "html", "css", "json", "yaml", "prisma" },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
      })
    end,
  },

  -- LSP

  -- Lspsaga
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup({
        lightbulb = { enable = false },
      })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Автодополнение
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        },
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.ts_ls.setup({
        settings = {
          typescript = {
            inlayHints = { enable = false }, -- подсказки отключены
          },
        },
      })
    end,
  },


  -- Форматирование
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        vue = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        lua = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = true,
      },
    },
    keys = {
      {
        "<Leader>fp",
        function()
          require("conform").format({ timeout_ms = 2000, lsp_fallback = true })
        end,
        desc = "Format buffer",
      },
    },
  },

  -- Автозакрытие тегов
  {
    "windwp/nvim-ts-autotag",
    opts = {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    },
  },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set("n", "<Leader>gb", gs.toggle_current_line_blame, { buffer = bufnr, desc = "Toggle blame" })
        vim.keymap.set("n", "<Leader>gd", gs.diffthis, { buffer = bufnr, desc = "Git diff" })
      end,
    },
  },

  -- Файловый менеджер
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      git = { enable = true },
      filters = { custom = { "^.git$" } },
    },
    keys = {
      { "<Leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    },
    config = function()
      require("nvim-tree").setup {
        sort = {
          sorter = "case_sensitive",
         },
         view = {
            side = "right",
           width = 30,
         },
         renderer = {
           group_empty = true,
         },
         filters = {
           dotfiles = true,
         },
      }
    end,
  },

  -- Сниппеты
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  }
}, {
  performance = {
    rtp = {
      disabled_plugins = { "netrw", "netrwPlugin" },
    },
  },
})

-- Установка темы
vim.cmd("colorscheme nightfox")
