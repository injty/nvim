local status, packer = pcall(require, 'packer')

if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim ]]

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'svrana/neosolarized.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'tjdevries/colorbuddy.nvim'
  use 'phha/zenburn.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use { 'akinsho/bufferline.nvim', tag = "v3.*" }
  use 'hoob3rt/lualine.nvim'
  use 'xiyaowong/nvim-transparent'

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'hrsh7th/nvim-cmp' -- autocompletion
  use 'hrsh7th/cmp-buffer' -- autocompletion
  use 'hrsh7th/cmp-path' -- autocompletion
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use { 'glepnir/lspsaga.nvim', branch = 'main' }
  use 'jose-elias-alvarez/typescript.nvim'
  use 'onsails/lspkind.nvim'

end)
