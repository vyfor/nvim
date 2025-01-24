vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'silent! wa',
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf
    local map = vim.keymap.set
    local buf = vim.lsp.buf

    vim.lsp.inlay_hint.enable(true)

    map(
      'n',
      'gD',
      buf.declaration,
      { buffer = bufnr, desc = 'Go To Declaration' }
    )
    map(
      'n',
      'gd',
      buf.definition,
      { buffer = bufnr, desc = 'Go to definition' }
    )
    map(
      'n',
      'gi',
      buf.implementation,
      { buffer = bufnr, desc = 'Go To Implementation' }
    )
    map(
      'n',
      'gy',
      buf.type_definition,
      { buffer = bufnr, desc = 'Go To Type Definition' }
    )
    map('n', 'gr', buf.references, { buffer = bufnr, desc = 'Show References' })
    map('n', 'gR', buf.rename, { buffer = bufnr, desc = 'Rename' })
    map(
      { 'n', 'v' },
      'ca',
      buf.references,
      { buffer = bufnr, desc = 'Code Action' }
    )

    if client.server_capabilities.inlayHintProvider then
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
  end,
})
