local function on_attach()
  local bufnr = vim.api.nvim_get_current_buf()
  local map = vim.keymap.set
  local buf = vim.lsp.buf

  vim.lsp.inlay_hint.enable(true)

  map('n', 'gD', buf.declaration, { buffer = bufnr, desc = 'Go To Declaration' })
  map('n', 'gd', buf.definition, { buffer = bufnr, desc = 'Go to definition' })
  map('n', 'gi', buf.implementation, { buffer = bufnr, desc = 'Go To Implementation' })
  map('n', 'gy', buf.type_definition, { buffer = bufnr, desc = 'Go To Type Definition' })
  map('n', 'gr', buf.references, { buffer = bufnr, desc = 'Show References' })
  map('n', '<leader>cr', buf.rename, { buffer = bufnr, desc = 'Rename' })
  map({ 'n', 'v' }, '<leader>ca', buf.references, { buffer = bufnr, desc = 'Code Action' })
  map(
    'n',
    '<leader>ch',
    function()
      vim.lsp.inlay_hint.enable(
        not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr },
        { bufnr = bufnr }
      )
    end,
    { buffer = bufnr, desc = 'Show Inlay Hints' }
  )
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = on_attach,
})

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
    init = function()
      vim.g.rustaceanvim = function()
        return {
          server = {
            on_attach = on_attach,
          },
        }
      end
    end,
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
