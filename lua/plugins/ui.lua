return {
  {
    'marko-cerovac/material.nvim',
    lazy = false,
    priority = 1000,
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
