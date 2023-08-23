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

