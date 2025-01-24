return {
  {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>rf',
        function() require('conform').format { async = true } end,
        mode = '',
        desc = 'Format Buffer',
      },
    },

    opts = {
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
      format_after_save = {},
    },
    init = function() vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()' end,
  },
}
