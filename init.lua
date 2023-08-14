-- Neovim https://neovim.io/
-- Local config goes in:
-- Windows: "~/AppData/Local/nvim/plugin/local.vim"
-- Unix: "~/.config/nvim/plugin/local.vim"

vim.cmd('silent! git -C ~/.var/app/io.neovim.nvim/config/nvim pull')

vim.env.MYVIMRC = vim.fn.stdpath('config') .. '/init.lua'

-- https://neovim.io/doc/user/options.html#option-summary
vim.opt.browsedir = 'buffer'
vim.opt.cursorline = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.wildmode = 'longest:full'

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

