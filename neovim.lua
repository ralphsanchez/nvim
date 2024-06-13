-- Neovim Roaming Config
-- https://neovim.io/doc/user/
-- Using Roblox Lua Style Guide https://roblox.github.io/lua-style-guide

-- Windows: scoop install neovim fvim
-- Flatpak: https://flathub.org/apps/io.neovim.nvim `flatpak install flathub io.neovim.nvim`

-- Windows: %LOCALAPPDATA%\nvim
-- Linux: ~/.config/nvim
-- Flatpak: ~/.var/app/io.neovim.nvim/config/nvim 

-- Options

vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = "longest:full"

vim.api.nvim_create_autocmd(
{"FileType"}, {
  pattern = "vim,lua",
  callback = function(ev)
    vim.opt.expandtab = true
    vim.opt.keywordprg = ":help"
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end
})

-- Mappings

vim.g.mapleader = " " -- leader key

-- Plugins https://dotfyle.com/neovim/plugins/trending
-- Lazy Packs Config https://github.com/folke/lazy.nvim#-plugin-spec

local packs = {
  -- Plugins
  { 'echasnovski/mini.nvim', version = '*' },
  { 'epwalsh/obsidian.nvim', version = '*', lazy = true, ft = 'markdown', dependencies = 'nvim-lua/plenary.nvim' },
  { 'gbprod/yanky.nvim' },
  { 'ggandor/leap.nvim' }, 
  { 'nvim-telescope/telescope.nvim' },
  { 'tpope/vim-unimpaired' },

  -- Colorschemes https://vimcolorschemes.com/
  { 'NLKNguyen/papercolor-theme' },
  { 'ajgrf/parchment' },
  { 'archseer/colibri.vim' },
  { 'axvr/raider.vim' },
  { 'echasnovski/mini.base16' },
  { 'cocopon/iceberg.vim' },
  { 'drazil100/dusklight.vim' },
  { 'folke/tokyonight.nvim' },
  { 'jaredgorski/fogbell.vim' },
  { 'josebalius/vim-light-chromeclipse' },
  { 'lmburns/kimbox' },
  { 'kvrohit/mellow.nvim' },
  { 'mcchrish/zenbones.nvim' },
  { 'morhetz/gruvbox' },
  { 'oxfist/night-owl.nvim' },
  { 'nelstrom/vim-mac-classic-theme' },
  { 'ntbbloodbath/sweetie.nvim' },
  { 'olivercederborg/poimandres.nvim' },
  { 'olivertaylor/vacme' },
  { 'ok-ryoko/blue-screen' },
  { 'oxfist/night-owl.nvim' },
  { 'preservim/vim-colors-pencil' },
  { 'progrimorio/nvim-nyctophilia' },
  { 'ray-x/aurora' },
  { 'rebelot/kanagawa.nvim' },
  { 'sainnhe/sonokai' },
  { 'sainnhe/everforest' },
  { 'slugbyte/lackluster.nvim' },
  { 'savq/melange-nvim' },
  { 'sts10/vim-pink-moon' },
  { 'Verf/deepwhite.nvim' },
  { 'wadackel/vim-dogrun' },
  { 'nordtheme/vim', name = 'nord_theme'},
  { 'challenger-deep-theme/vim', name = 'challenger_deep_theme'},
  { 'Verf/deepwhite.nvim', name = 'deepwhite_theme' },
  { 'catppuccin/nvim', name = 'catppuccin_theme' },
  { 'dracula/vim', name = 'dracula_theme' },
  { 'embark-theme/vim', name = 'embark_theme' },
  { 'rose-pine/neovim', name = 'rosepine_theme' },
}

-- Lazy https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazyopts = {}

if vim.fn.has("win32") == 1 then
  lazyopts.browser = "C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe"
end

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

if not vim.g.lazy_did_setup then
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(packs, lazyopts)
end

--
-- Frontends

-- goneovim https://github.com/akiyosi/goneovim
