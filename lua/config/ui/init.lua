vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.cmd [[
      colorscheme material-deep-ocean
      highlight SLModeBorder guifg=#82aaff guibg=NONE
      highlight SLModeText guifg=#171723 guibg=#82aaff
      highlight SLFileText guifg=#82aaff guibg=#171723
      highlight SLLocationText guifg=#c792ea guibg=#171723
      highlight SLCursorBorder guifg=#c792ea guibg=NONE
      highlight SLCursorText guifg=#171723 guibg=#c792ea
    ]]

    vim.o.statusline =
      '%#SLModeBorder#%#SLModeText#%{mode()}%#SLModeBorder# %#SLFileText#%f%=%#SLLocationText#%P%#SLCursorBorder# %#SLCursorText#%l:%c%#SLCursorBorder#'
  end,
  once = true,
})
