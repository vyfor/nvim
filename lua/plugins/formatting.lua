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
        desc = 'Format buffer',
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
      formatters = {
        stylua = {
          prepend_args = {
            '--config-path',
            'C:/Users/1/.config/stylua/.stylua.toml',
          },
        },
      },
    },
    init = function()
      vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()'
    end,
  },
}
