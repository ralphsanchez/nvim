-- Neovim https://neovim.io/

-- https://neovim.io/doc/user/options.html#option-summary
vim.o.browsedir = "buffer"
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wildmode = "longest:full"

-- Default colorscheme https://vimcolorschemes.com/
if not pcall(vim.cmd.colorscheme, "habamax") then
  vim.cmd.colorscheme("habamax")
end

vim.api.nvim_create_autocmd(
  {"FileType"}, 
  {
    pattern = "vim,lua",
    callback = function(ev)
      vim.o.expandtab = true
      vim.o.shiftwidth = 2
      vim.o.tabstop = 2
    end
  })

if vim.g.goneovim then
  -- https://github.com/akiyosi/goneovim
  -- :h goneovim.txt
  vim.cmd("command! GonvimConfig :split ~/.goneovim/settings.toml")
end

if vim.g.neovide then
  -- https://neovide.dev/configuration.html
	vim.g.neovide_remember_window_size = true
	vim.opt.guifont = {"Cascadia Mono:h10"}

  if not pcall(vim.cmd.colorscheme, "colibri") then
    vim.cmd.colorscheme("habamax")
  end
end
