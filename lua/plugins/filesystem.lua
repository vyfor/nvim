return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    cmd = 'Telescope',
    keys = {
      {
        '<leader>ff',
        '<cmd>Telescope find_files<cr>',
        desc = 'Find Files',
      },
      {
        '<leader>fb',
        '<cmd>Telescope buffers<cr>',
        desc = 'Find Buffers',
      },
      {
        '<leader>fw',
        '<cmd>Telescope live_grep<cr>',
        desc = 'Live Grep',
      },
    },
  },
  {
    'echasnovski/mini.files',
    dependencies = 'echasnovski/mini.icons',
    version = '*',
    keys = {
      {
        '<leader>E',
        '<cmd>lua MiniFiles.open()<cr>',
        desc = 'File Explorer',
      },
    },
    opts = {},
  },
}
