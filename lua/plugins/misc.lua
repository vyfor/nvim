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
}
