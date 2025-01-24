return {
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      plugins = {
        'mini',
        'nvim-cmp',
        'nvim-web-devicons',
        'telescope',
      },
      disable = {
        background = true,
      },
    },
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'LspAttach',
    priority = 1000,
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config { virtual_text = false }
    end,
  },
}
