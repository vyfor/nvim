return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'nvim-treesitter.configs',
    opts = {
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
    },
  },

  {
    'vyfor/cord.nvim',
    branch = 'client-server',
    build = ':Cord update',
    event = 'SafeState',
    opts = {
      buttons = {
        {
          label = 'View Repository',
          url = function(opts) return opts.repo_url end,
        },
      },
    },
  },

  {
    'folke/which-key.nvim',
    dependencies = 'echasnovski/mini.icons',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>?',
        function() require('which-key').show { global = false } end,
        { desc = 'Show which-key' },
      },
    },
    opts = {},
  },
}
