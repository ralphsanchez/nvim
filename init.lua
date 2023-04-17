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

vim.api.nvim_create_autocmd({"VimEnter"}, {
  pattern = {"*"},
  callback = function() 
    vim.cmd("colorscheme " .. vim.g.COLOR)
  end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "vim,lua",
    callback = function(ev)
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
    end
  })

local packs = {}

table.insert(packs, "BurntSushi/ripgrep")
table.insert(packs, "nvim-lua/plenary.nvim") -- library for many plugins
table.insert(packs, "sbdchd/neoformat")
table.insert(packs, "stevearc/dressing.nvim") -- Make UI prettier
table.insert(packs, { "ellisonleao/glow.nvim", config = true, cmd = "Glow" }) -- Preview markdown documents.
table.insert(packs, "LinArcX/telescope-command-palette.nvim")

table.insert(packs, { 
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require('telescope').setup({
			extensions = {
				command_palette = {
					{
						"File",
						{ "entire selection (C-a)", ':call feedkeys("GVgg")' },
						{ "save current file (C-s)", ':w' },
						{ "save all files (C-A-s)", ':wa' },
						{ "quit (C-q)", ':qa' },
						{ "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
						{ "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
						{ "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
						{ "files (C-f)",     ":lua require('telescope.builtin').find_files()", 1 },
					},
					{
						"Help",
						{ "tips", ":help tips" },
						{ "cheatsheet", ":help index" },
						{ "tutorial", ":help tutor" },
						{ "summary", ":help summary" },
						{ "quick reference", ":help quickref" },
						{ "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
					},
					{	
						"Vim",
						{ "reload vimrc", ":source $MYVIMRC" },
						{ 'check health', ":checkhealth" },
						{ "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
						{ "commands", ":lua require('telescope.builtin').commands()" },
						{ "command history", ":lua require('telescope.builtin').command_history()" },
						{ "registers (A-e)", ":lua require('telescope.builtin').registers()" },
						{ "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
						{ "vim options", ":lua require('telescope.builtin').vim_options()" },
						{ "keymaps", ":lua require('telescope.builtin').keymaps()" },
						{ "buffers", ":Telescope buffers" },
						{ "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
						{ "paste mode", ':set paste!' },
						{ 'cursor line', ':set cursorline!' },
						{ 'cursor column', ':set cursorcolumn!' },
						{ "spell checker", ':set spell!' },
						{ "relative number", ':set relativenumber!' },
						{ "search highlighting (F12)", ':set hlsearch!' },
					}
				}
			}
		})
    require('telescope').load_extension("command_palette")
    vim.keymap.set("n", "<F12>", ":Telescope command_palette<cr>")
	end
})

table.insert(packs, {
	"dcampos/nvim-snippy", 
	config = function()
		require("snippy").setup({
			mappings = {
				is = {
					["<Tab>"] = "expand_or_advance",
					["<S-Tab>"] = "previous",
				},
				nx = {
					["<leader>x"] = "cut_text",
				},
			},
		})
	end,
})

table.insert(packs, {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
    require("which-key").setup({ })
	end,
})

local themes = {
  "archseer/colibri.vim", -- Color similar to helix text editor
  "NLKNguyen/papercolor-theme",
  {"catppuccin/nvim", name = "catppuccin", as = "catppuccin" },
  {"Mofiqul/dracula.nvim", name = "dracula.nvim", as = "dracula"},
  "cocopon/iceberg.vim",
  "wadackel/vim-dogrun",
  "ray-x/aurora",
  "preservim/vim-colors-pencil",
  "arcticicestudio/nord-vim",
  {"embark-theme/vim", name = "embark-theme", as = "embark-theme" },
  {"challenger-deep-theme/vim", name = "challenger-deep-theme", as = "challenger-deep-theme" },
}
for k, v in pairs(themes) do table.insert(packs, v) end

local paq_on, paq = pcall(require, "paq")
if false and paq_on then
  table.insert(packs, 1, "savq/paq-nvim")
  paq { packs }
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)
local lazy_on, lazy = pcall(require, "lazy")
if true and lazy_on then lazy.setup(packs) end

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
