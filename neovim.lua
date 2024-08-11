-- Neovim Roaming Config https://neovim.io/doc/user/

vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = "longest:full"

vim.api.nvim_create_autocmd("FileType", {
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

-- Plugins https://dotfyle.com/neovim/plugins/trending https://github.com/folke/lazy.nvim#-plugin-spec

local packs = {}

-- Lazy https://lazy.folke.io/
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
  --require("lazy").setup(packs, lazyopts)
  require("lazy").setup("plugins", lazyopts)
end
