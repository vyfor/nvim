return {
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'BufAdd',
    keys = {
      { '<[b>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev Buffer' },
      { '<]b>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next Buffer' },
      {
        '<leader><b[>',
        '<cmd>BufferLineMovePrev<CR>',
        desc = 'Move Prev Buffer',
      },
      {
        '<leader><b]>',
        '<cmd>BufferLineMoveNext<CR>',
        desc = 'Move Next Buffer',
      },
      { '<leader>bb', '<cmd>BufferLinePick<CR>', desc = 'Pick Buffer' },
      {
        '<leader>bn',
        '<cmd>BufferLineCloseRight<CR>',
        desc = 'Close Buffers To The Right',
      },
      {
        '<leader>bp',
        '<cmd>BufferLineCloseLeft<CR>',
        desc = 'Close Buffers To The Left',
      },
      {
        '<leader>bC',
        '<cmd>BufferLineCloseOthers<CR>',
        desc = 'Close Other Buffers',
      },
    },
    opts = {
      options = {
        themable = true,
        indicator = {
          style = 'underline',
        },
        buffer_close_icon = '',
        close_icon = '',
        diagnostics = false,
      },
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
    opts = {},
  },

  {
    'folke/flash.nvim',
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
    opts = function()
      return {
        highlight = {
          groups = {
            label = 'Normal',
          },
        },
      }
    end,
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
