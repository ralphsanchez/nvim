return {
  -- Plugins
  { 'echasnovski/mini.nvim', version = '*' }, -- Small neovim library/set of lua modules. :h mini.mvim
  { 'epwalsh/obsidian.nvim', version = '*', lazy = true, ft = 'markdown', dependencies = 'nvim-lua/plenary.nvim' },
  { 'gbprod/yanky.nvim' },
  { 'ggandor/leap.nvim' }, 
  { 'nvim-telescope/telescope.nvim' },
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
