local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim ]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- ui
  use 'olivercederborg/poimandres.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'rmehri01/onenord.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'rafamadriz/onepro'
  use 'rebelot/kanagawa.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'hoob3rt/lualine.nvim'
  use 'xiyaowong/nvim-transparent'

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'numToStr/Comment.nvim'

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

end)
