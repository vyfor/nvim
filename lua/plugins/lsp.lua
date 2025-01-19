local function on_attach(_, bufnr)
  local map = vim.keymap.set
  local buf = vim.lsp.buf

  map(
    'n',
    'gD',
    buf.declaration,
    { buffer = bufnr, desc = 'Go to declaration' }
  )
  map('n', 'gd', buf.definition, { buffer = bufnr, desc = 'Go to definition' })
  map(
    'n',
    'gi',
    buf.implementation,
    { buffer = bufnr, desc = 'Go to implementation' }
  )
  map(
    'n',
    'gy',
    buf.type_definition,
    { buffer = bufnr, desc = 'Go to type definition' }
  )
  map('n', 'gr', buf.references, { buffer = bufnr, desc = 'Show references' })
  map('n', 'gR', buf.rename, { buffer = bufnr, desc = 'Rename' })
  map(
    { 'n', 'v' },
    'ca',
    buf.references,
    { buffer = bufnr, desc = 'Code action' }
  )
end

return {
  {
    'neovim/nvim-lspconfig',
    event = 'InsertEnter',
    config = function()
      local lspconfig = require 'lspconfig'

      lspconfig.lua_ls.setup {
        capabilities = vim.lsp.protocol.make_client_capabilities(),
        on_attach = on_attach,
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
}
