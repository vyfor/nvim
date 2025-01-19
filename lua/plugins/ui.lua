return {
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      plugins = {
        'flash',
        'mini',
        'nvim-cmp',
        'nvim-web-devicons',
        'telescope',
        'which-key',
      },
      disable = {
        background = true,
      },
    },
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    event = 'InsertEnter',
    init = function()
      vim.diagnostic.config {
        virtual_text = false,
      }
    end,
    config = function() require('lsp_lines').setup() end,
  },
}
