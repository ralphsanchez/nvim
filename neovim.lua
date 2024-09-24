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

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugins https://dotfyle.com/neovim/plugins/trending https://github.com/folke/lazy.nvim#-plugin-spec

local packs = {
  { 'echasnovski/mini.nvim', version = '*' }, -- Small neovim library/set of lua modules. :h mini.mvim
  { 'epwalsh/obsidian.nvim', version = '*', lazy = true, ft = 'markdown', dependencies = 'nvim-lua/plenary.nvim' },
  { 'gbprod/yanky.nvim' },
  { 'ggandor/leap.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter' },
  {
    'stevearc/aerial.nvim', -- aerial, displays a code outline window
    opts = {
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    }
  },
  { 'tpope/vim-unimpaired' },
  { 'nvim-tree/nvim-web-devicons' },
}

-- Themes
local themes = {
  { 'NLKNguyen/papercolor-theme' },
  { 'Verf/deepwhite.nvim' },
  { 'ajgrf/parchment' },
  { 'archseer/colibri.vim' },
  { 'axvr/raider.vim' },
  { 'catppuccin/nvim', name = 'catppuccin_theme' },
  { 'challenger-deep-theme/vim', name = 'challenger_deep_theme'},
  { 'cocopon/iceberg.vim' },
  { 'diegoulloao/neofusion.nvim' },
  { 'dracula/vim', name = 'dracula_theme' },
  { 'drazil100/dusklight.vim' },
  { 'echasnovski/mini.base16' },
  { 'embark-theme/vim', name = 'embark_theme' },
  { 'folke/tokyonight.nvim' },
  { 'jaredgorski/fogbell.vim' },
  { 'josebalius/vim-light-chromeclipse' },
  { 'kvrohit/mellow.nvim' },
  { 'lmburns/kimbox' },
  { 'mcchrish/zenbones.nvim' },
  { 'morhetz/gruvbox' },
  { 'nelstrom/vim-mac-classic-theme' },
  { 'nordtheme/vim', name = 'nord_theme'},
  { 'ntbbloodbath/sweetie.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
  { 'ok-ryoko/blue-screen' },
  { 'olivercederborg/poimandres.nvim' },
  { 'olivertaylor/vacme' },
  { 'oxfist/night-owl.nvim' },
  { 'preservim/vim-colors-pencil' },
  { 'progrimorio/nvim-nyctophilia' },
  { 'ray-x/aurora' },
  { 'rebelot/kanagawa.nvim' },
  { 'rose-pine/neovim', name = 'rosepine_theme' },
  { 'sainnhe/everforest' },
  { 'sainnhe/sonokai' },
  { 'savq/melange-nvim' },
  { 'slugbyte/lackluster.nvim' },
  { 'sts10/vim-pink-moon' },
  { 'wadackel/vim-dogrun' },
}

-- Lazy https://lazy.folke.io/installation
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

if not vim.g.lazy_did_setup then
  -- https://lazy.folke.io/configuration
  require("lazy").setup({
    spec = { packs, themes },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
  })
end
