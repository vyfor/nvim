vim.api.nvim_create_autocmd('FocusLost', {
  pattern = '*',
  command = 'silent! wa'
})