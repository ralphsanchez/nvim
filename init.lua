-- Neovim https://neovim.io/
-- Local config goes in:
--   Windows: "~/AppData/Local/nvim/plugin/local.vim"
--   Unix: "~/.config/nvim/plugin/local.vim"

-- https://neovim.io/doc/user/options.html#option-summary
vim.opt.browsedir = "buffer"
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = "longest:full"

vim.g.mapleader = " "

-- Cycle through my preferred colors
local colors = { "catppuccin", "colibri", "nord", "iceberg", "aurora" }
color_index = #colors
vim.keymap.set("", "<C-F11>", 
  function()
    color_index = color_index + 1
    if color_index > #colors then color_index = 1 end
    vim.cmd("colorscheme " .. colors[color_index])
    vim.cmd("echo g:colors_name")
  end)

vim.api.nvim_create_autocmd({"ColorScheme"}, {
  pattern = {"*"},
  command = "let COLOR = g:colors_name"
})

vim.o.guifont = table.concat({ "Consolas:h10", "Courier_New:h10" }, ",")

vim.api.nvim_create_autocmd(
  {"VimEnter"}, {
    pattern = {"*"},
    callback = function() 
      vim.cmd("colorscheme " .. vim.g.COLOR)
    end
  })

vim.api.nvim_create_autocmd(
  {"FileType"}, {
    pattern = "vim,lua",
    callback = function(ev)
      vim.opt.expandtab = true
      vim.opt.keywordprg = ':help'
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
    end
  })

local packs = {}

-- plugins
table.insert(packs, "BurntSushi/ripgrep")
table.insert(packs, "LinArcX/telescope-command-palette.nvim")
table.insert(packs, "bakpakin/janet.vim")
table.insert(packs, "tpope/vim-unimpaired")
table.insert(packs, { "folke/which-key.nvim", run = function() require("which-key").setup({ }) end })

-- themes
table.insert(packs, "NLKNguyen/papercolor-theme")
table.insert(packs, "arcticicestudio/nord-vim")
table.insert(packs, "cocopon/iceberg.vim")
table.insert(packs, "preservim/vim-colors-pencil")
table.insert(packs, "ray-x/aurora")
table.insert(packs, "rebelot/kanagawa.nvim")
table.insert(packs, "sts10/vim-pink-moon")
table.insert(packs, "wadackel/vim-dogrun")
table.insert(packs, { "Mofiqul/dracula.nvim", as = "dracula" })
table.insert(packs, { "catppuccin/nvim", as = "catppuccin" })
table.insert(packs, { "challenger-deep-theme/vim", as = "challenger-deep-theme" })
table.insert(packs, { "embark-theme/vim", as = "embark-theme" })
table.insert(packs, "archseer/colibri.vim")

-- paq https://github.com/savq/paq-nvim
local function init_paq()
  local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
  local installed = vim.fn.empty(vim.fn.glob(path)) == 0
  if not installed then
    return vim.fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", path }
  end
  local paq_on, paq = pcall(require, "paq")
  table.insert(packs, 1, "savq/paq-nvim")
  paq { packs }
end

if vim.g.goneovim then
  -- https://github.com/akiyosi/goneovim
  -- scoop install goneovim
  -- :h goneovim.txt
  vim.cmd("command! GonvimConfig :split ~/.goneovim/settings.toml")
end

if vim.g.neovide then
  -- https://neovide.dev/
  -- scoop install neovide
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
  vim.g.neovide_cursor_vfx_mode = "" -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- only for railgun
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- only for railgun
  vim.g.neovide_cursor_vfx_particle_speed = 3.0

  vim.g.neovide_fullscreen = false
  vim.keymap.set("", "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
end

-- Links
-- https://github.com/rockerBOO/awesome-neovim
