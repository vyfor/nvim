vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.cmd [[
      colorscheme material-deep-ocean
      highlight StatusLine guifg=NONE guibg=NONE ctermbg=NONE cterm=NONE
      highlight SLModeBorder guifg=#82aaff guibg=NONE
      highlight SLModeText guifg=#171723 guibg=#82aaff
      highlight SLFileText guifg=#82aaff guibg=NONE
      highlight StatusFiller guifg=NONE guibg=NONE ctermbg=NONE cterm=NONE
      highlight SLLocationText guifg=#c792ea guibg=NONE
      highlight SLCursorBorder guifg=#c792ea guibg=NONE
      highlight SLCursorText guifg=#171723 guibg=#c792ea
    ]]

    vim.o.statusline =
      '%#SLModeBorder#%#SLModeText#%{mode()}%#SLModeBorder# %#SLFileText#%f%#StatusFiller#%=%#SLLocationText#%P%#SLCursorBorder# %#SLCursorText#%l:%c%#SLCursorBorder#'
  end,
  once = true,
})
