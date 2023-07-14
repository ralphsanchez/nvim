-- Neovim https://neovim.io/
-- Local config goes in:
-- Windows: "~/AppData/Local/nvim/plugin/local.vim"
-- Unix: "~/.config/nvim/plugin/local.vim"

vim.env.MYVIMRC = vim.fn.stdpath('config') .. '/init.lua'

-- https://neovim.io/doc/user/options.html#option-summary
vim.opt.browsedir = 'buffer'
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = 'longest:full'

-- Cycle through my preferred colors
local colors = { 'catppuccin', 'colibri', 'nord', 'iceberg', 'aurora' }
color_index = #colors
vim.keymap.set('', '<C-F11>', 
  function()
    color_index = color_index + 1
    if color_index > #colors then color_index = 1 end
    vim.cmd('colorscheme ' .. colors[color_index])
    vim.cmd('echo g:colors_name')
  end)

-- Fonts and Colors
if vim.fn.has('gui_running') then
  vim.cmd([[colorscheme catppuccin | set guifont=Consolas:h12]])
else
end

vim.api.nvim_create_autocmd(
  {'FileType'}, {
    pattern = 'vim,lua',
    callback = function(ev)
      vim.opt.expandtab = true
      vim.opt.keywordprg = ':help'
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
    end
  })

-- https://neovide.dev/ `scoop install neovide`
if vim.g.neovide then
	vim.g.neovide_remember_window_size = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_top = 0
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_scale_factor = 1.0 -- Zoom in/out without changing font size.
  vim.g.neovide_scroll_animation_length = 0.3
  vim.g.neovide_transparency = 1.0 -- 1.0 == solid, 0.0 == no background

  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  vim.g.neovide_cursor_vfx_mode = '' -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- only for railgun
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- only for railgun
  vim.g.neovide_cursor_vfx_particle_speed = 3.0

  vim.g.neovide_fullscreen = false
  vim.keymap.set('', '<F11>', function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
end

-- https://github.com/hismailbulut/Neoray
if vim.g.neoray then
	vim.cmd([[
	set guifont=Go_Mono:h11
	NeoraySet CursorAnimTime 0.08
	NeoraySet Transparency   0.95
	NeoraySet TargetTPS      120
	NeoraySet BoxDrawing     true
	NeoraySet ImageViewer    true
	NeoraySet WindowSize     100x40
	NeoraySet WindowState    centered
	NeoraySet KeyFullscreen  <M-C-CR>
	NeoraySet KeyZoomIn      <C-ScrollWheelUp>
	NeoraySet KeyZoomOut     <C-ScrollWheelDown>

	NeoraySet ContextMenu true
	]])
end

-- https://github.com/yatli/fvim
if vim.g.fvim_loaded then
	vim.cmd([[
	FVimCursorSmoothMove v:true
	FVimCursorSmoothBlink v:true
	]])
end

local packs = {
  -- plugins
  'BurntSushi/ripgrep',
  'bakpakin/janet.vim',
  'tpope/vim-unimpaired',
  'gennaro-tedesco/nvim-peekup',
  'nvim-lua/plenary.nvim',
  'nvim-telescope/telescope.nvim',
  'stevearc/dressing.nvim',
  { 
    'tomasky/bookmarks.nvim', 
    run = function()
      require('bookmarks').setup({
        save_file = vim.fn.stdpath('data') .. '/bookmarks'
      })
    end
  },
  { 'folke/which-key.nvim', run = function() require('which-key').setup({ }) end },

  -- colorschemes https://vimcolorschemes.com/
  'NLKNguyen/papercolor-theme',
  'ajgrf/parchment',
  'archseer/colibri.vim',
  'arcticicestudio/nord-vim',
  'cocopon/iceberg.vim',
  'folke/tokyonight.nvim',
  'jaredgorski/fogbell.vim',
  'josebalius/vim-light-chromeclipse',
  'lmburns/kimbox',
  'morhetz/gruvbox',
  'nelstrom/vim-mac-classic-theme',
  'ntbbloodbath/sweetie.nvim',
  'olivertaylor/vacme',
  'ok-ryoko/blue-screen',
  'oxfist/night-owl.nvim',
  'preservim/vim-colors-pencil',
  'progrimorio/nvim-nyctophilia',
  'ray-x/aurora',
  'rebelot/kanagawa.nvim',
  'sainnhe/sonokai',
  'sainnhe/everforest',
  'savq/melange-nvim',
  'sts10/vim-pink-moon',
  'wadackel/vim-dogrun',
  { 'Mofiqul/dracula.nvim', as = 'dracula' },
  { 'catppuccin/nvim', as = 'catppuccin' },
  { 'challenger-deep-theme/vim', as = 'challenger-deep-theme' },
  { 'embark-theme/vim', as = 'embark-theme' },
}

-- paq.nvim https://github.com/savq/paq-nvim
local paq = require('paq')
if true and package.loaded['paq'] then 
  table.insert(packs, 1, 'savq/paq-nvim')
  paq(packs)
end

-- lazy.nvim https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if false and not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git clone --filter=blob:none https://github.com/folke/lazy.nvim.git --branch=stable", lazypath})
end
if false and vim.loop.fs_stat(lazypath) then
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(packs, opts)
end

