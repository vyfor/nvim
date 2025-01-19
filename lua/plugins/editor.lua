return {
  {
    'willothy/nvim-cokeline',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    event = 'BufAdd',
    keys = {
      { '<[b>', '<Plug>(cokeline-focus-prev)', desc = 'Prev Buffer' },
      { '<]b>', '<Plug>(cokeline-focus-next)', desc = 'Next Buffer' },
    },
    opts = {
      show_if_buffers_are_at_least = 2,
      sidebar = false,
    },
  },

  {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    opts = {
      modes = {
        terminal = false,
      },
      skip_ts = { 'string' },
      skip_unbalanced = true,
      markdown = true,
    },
  },

  {
    'echasnovski/mini.ai',
    event = 'SafeState',
    opts = {},
  },

  {
    'echasnovski/mini.surround',
    keys = {
      { 'gsa', desc = 'Add Surrounding', mode = { 'n', 'v' } },
      { 'gsd', desc = 'Delete Surrounding' },
      { 'gsr', desc = 'Replace Surrounding' },
      { 'gsf', desc = 'Find Right Surrounding' },
      { 'gsF', desc = 'Find Left Surrounding' },
      { 'gsh', desc = 'Highlight Surrounding' },
      { 'gsn', desc = 'Update `n_lines`' },
    },
    opts = {
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
        update_n_lines = 'gsn',
      },
    },
  },

  {
    'folke/flash.nvim',
    event = 'SafeState',
    keys = {
      {
        's',
        mode = { 'n', 'x', 'o' },
        function() require('flash').jump() end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function() require('flash').treesitter() end,
        desc = 'Flash Treesitter',
      },
      {
        'R',
        mode = { 'o', 'x' },
        function() require('flash').treesitter_search() end,
        desc = 'Treesitter Search',
      },
      {
        '<c-s>',
        mode = { 'c' },
        function() require('flash').toggle() end,
        desc = 'Toggle Flash Search',
      },
    },
    opts = {},
  },

  {
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    cmd = {
      'SupermavenUseFree',
      'SupermavenUsePro',
    },
    opts = {
      ignore_filetypes = { 'bigfile' },
    },
  },
}
