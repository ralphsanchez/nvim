if false then -- enable/disable packer
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
  use 'arcticicestudio/nord-vim'
  use 'cocopon/iceberg.vim'
  use 'folke/tokyonight.nvim'
  use 'jaredgorski/fogbell.vim'
  use 'josebalius/vim-light-chromeclipse'
  use 'lmburns/kimbox'
  use 'morhetz/gruvbox'
  use 'nelstrom/vim-mac-classic-theme'
  use 'ntbbloodbath/sweetie.nvim'
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
  use 'wadackel/vim-dogrun'
  use { 'Mofiqul/dracula.nvim', as = 'dracula' }
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use { 'challenger-deep-theme/vim', as = 'challenger-deep-theme' }
  use { 'embark-theme/vim', as = 'embark-theme' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

