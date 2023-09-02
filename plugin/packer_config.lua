if true then -- enable/disable packer
  return
end

-- packer.nvim https://github.com/wbthomason/packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Plugins
  use 'tpope/vim-unimpaired'

  -- Colorschemes https://vimcolorschemes.com/
  use 'NLKNguyen/papercolor-theme'
  use 'ajgrf/parchment'
  use 'archseer/colibri.vim'
  use 'axvr/raider.vim'
  use 'echasnovski/mini.base16'
  use 'cocopon/iceberg.vim'
  use 'drazil100/dusklight.vim'
  use 'folke/tokyonight.nvim'
  use 'jaredgorski/fogbell.vim'
  use 'josebalius/vim-light-chromeclipse'
  use 'lmburns/kimbox'
  use 'kvrohit/mellow.nvim'
  use 'morhetz/gruvbox'
  use 'nelstrom/vim-mac-classic-theme'
  use 'ntbbloodbath/sweetie.nvim'
  use 'olivercederborg/poimandres.nvim'
  use 'olivertaylor/vacme'
  use 'ok-ryoko/blue-screen'
  use 'oxfist/night-owl.nvim'
  use 'preservim/vim-colors-pencil'
  use 'progrimorio/nvim-nyctophilia'
  use 'ray-x/aurora'
  use 'rebelot/kanagawa.nvim'
  use 'sainnhe/sonokai'
  use 'sainnhe/everforest'
  use 'savq/melange-nvim'
  use 'sts10/vim-pink-moon'
  use 'Verf/deepwhite.nvim'
  use 'wadackel/vim-dogrun'
  use {'Mofiqul/dracula.nvim', as = 'dracula'}
  use {'nordtheme/vim', as = 'nord-vim'}
  use {'catppuccin/nvim', as = 'catppuccin'}
  use {'challenger-deep-theme/vim', as = 'challenger-deep-theme'}
  use {'embark-theme/vim', as = 'embark-theme'}
  use {'rose-pine/neovim', as = 'rose-pine'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

