-- Neovim https://neovim.io/

-- https://neovim.io/doc/user/options.html#option-summary
vim.opt.browsedir = "buffer"
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = "longest:full"

vim.api.nvim_create_autocmd(
  {"FileType"}, 
  {
    pattern = "vim,lua",
    callback = function(ev)
      vim.opt.expandtab = true
      vim.opt.shiftwidth = 2
      vim.opt.tabstop = 2
    end
  })

local paq_on, paq = pcall(require, "paq")
if paq_on then
  -- git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\nvim-data\site\pack\paqs\start\paq-nvim"
  -- git clone --depth=1 https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
  paq {
    "savq/paq-nvim";

    -- Colors
    {"archseer/colibri.vim"}; -- Color similar to helix text editor
    {"NLKNguyen/papercolor-theme", run = "vim.cmd('set bg=light')"};
    {"catppuccin/nvim", as = "catppuccin"};
    {"Mofiqul/dracula.nvim", as = "dracula.nvim"};
    {"cocopon/iceberg.vim"};
    {"wadackel/vim-dogrun"};
    {"ray-x/aurora"};
    {"preservim/vim-colors-pencil"};
    {"arcticicestudio/nord-vim"};
    {"embark-theme/vim", as = "embark-theme"};
    {"challenger-deep-theme/vim", as = "challenger-deep-theme"};
  }
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
	vim.opt.guifont = {"Cascadia Mono:h10"}

  if not pcall(vim.cmd.colorscheme, "colibri") then
    vim.cmd.colorscheme("habamax")
  end
end
