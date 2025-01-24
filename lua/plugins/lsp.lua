return {
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspStart', 'LspStop', 'LspRestart' },
    keys = {
      { '<leader>ls', '<cmd>LspStart<cr>', desc = 'Start LSP' },
      { '<leader>lt', '<cmd>LspStop<cr>', desc = 'Stop LSP' },
      { '<leader>lr', '<cmd>LspRestart<cr>', desc = 'Restart LSP' },
    },
    init = function()
      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
          },
        },
      }
    end,
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      }
    end,
  },

  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',
    event = { 'InsertEnter', 'CmdlineEnter' },
    version = '*',
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opts_extend = { 'sources.default' },
  },

  {
    'mrcjkb/rustaceanvim',
    ft = 'rust',
    version = '^5',
  },

  {
    'saecki/crates.nvim',
    keys = {
      {
        '<leader>Cv',
        function()
          require('crates').show_versions_popup()
          require('crates').focus_popup()
        end,
        desc = 'Show Crate Versions',
        ft = 'toml',
      },
      {
        '<leader>Cf',
        function()
          require('crates').show_features_popup()
          require('crates').focus_popup()
        end,
        desc = 'Show Crate Features',
        ft = 'toml',
      },
    },
    event = { 'BufRead Cargo.toml' },
    opts = {
      lsp = {
        enabled = true,
        on_attach = on_attach,
        actions = true,
        completion = true,
        hover = true,
        popup = {
          autofocus = true,
          border = 'rounded',
        },
      },
    },
  },
}
