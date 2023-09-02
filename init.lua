-- Neovim Config https://neovim.io/doc/user/

-- Windows: scoop install neovim fvim
-- Flatpak: https://flathub.org/apps/io.neovim.nvim `flatpak install flathub io.neovim.nvim`

-- Windows: %LOCALAPPDATA%\nvim
-- Linux: ~/.config/nvim
-- Flatpak: ~/.var/app/io.neovim.nvim/config/nvim

-- Options

vim.opt.browsedir = "buffer"
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

-- Packs

-- get plugins https://dotfyle.com/neovim/plugins/trending
-- get colorscheme https://vimcolorschemes.com
-- lazy pack definition https://github.com/folke/lazy.nvim#-plugin-spec

local packs = {
  { "Verf/deepwhite.nvim", name = "deepwhite_theme" },
  { "catppuccin/nvim", name = "catppuccin_theme", config = function() vim.cmd("colorscheme catppuccin-frappe") end },
  { "dracula/vim", name = "dracula_theme" },
  { "embark-theme/vim", name = "embark_theme" },
  { "rose-pine/neovim", name = "rosepine_theme" },
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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(packs, lazyopts)

-- Neovide GUI https://neovide.dev/
if vim.g.neovide then
  vim.o.guifont = "Consolas:h14"
end
