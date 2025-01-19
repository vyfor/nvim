vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    local keymaps = {
      n = {
        ['<C-d>'] = {
          '<C-d>zz',
          desc = 'Move half screen down and center view',
        },
        ['<C-u>'] = {
          '<C-u>zz',
          desc = 'Move half screen up and center view',
        },
        ['<C-h>'] = {
          '<C-w>h',
          desc = 'Move to the window on the left',
        },
        ['<C-j>'] = {
          '<C-w>j',
          desc = 'Move to the window below',
        },
        ['<C-k>'] = {
          '<C-w>k',
          desc = 'Move to the window above',
        },
        ['<C-l>'] = {
          '<C-w>l',
          desc = 'Move to the window on the right',
        },
        ['<leader>|'] = {
          '<cmd>vsplit<CR>',
          desc = 'Split window vertically',
        },
        ['<leader>-'] = {
          '<cmd>split<CR>',
          desc = 'Split window horizontally',
        },
        ['<leader>wc'] = {
          '<C-w>c',
          desc = 'Close window',
        },
        ['<leader>wr'] = {
          '<C-w>r',
          desc = 'Rearrange windows',
        },
        ['<leader>bc'] = {
          '<cmd>bd<CR>',
          desc = 'Close buffer',
        },
        ['<leader>v'] = {
          '"*',
          desc = 'Select system clipboard register',
        },
      },
      v = {
        ['<'] = {
          '<gv',
          desc = 'Unindent line',
        },
        ['>'] = {
          '>gv',
          desc = 'Indent line',
        },
        ['<A-j>'] = {
          ':m \'>+1<CR>gv=gv',
          desc = 'Move selection down',
        },
        ['<A-k>'] = {
          ':m \'<-2<CR>gv=gv',
          desc = 'Move selection up',
        },
      },
      x = {
        ['J'] = {
          ':m \'>+1<CR>gv-gv',
          desc = 'Move selection down',
        },
        ['K'] = {
          ':m \'<-2<CR>gv-gv',
          desc = 'Move selection up',
        },
        ['<A-j>'] = {
          ':m \'>+1<CR>gv-gv',
          desc = 'Move selection down',
        },
        ['<A-k>'] = {
          ':m \'<-2<CR>gv-gv',
          desc = 'Move selection up',
        },
      },
    }

    local map = vim.keymap.set
    for mode, mappings in pairs(keymaps) do
      for key, mapping in pairs(mappings) do
        local opts = { noremap = true, silent = true }
        opts.desc = mapping.desc

        map(mode, key, mapping[1], opts)
      end
    end
  end,
})
