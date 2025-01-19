local datapath = vim.fn.stdpath 'data'
local lazypath = datapath .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  lockfile = datapath .. '/lazy-lock.json',
  git = {
    timeout = 300,
  },
  checker = {
    enabled = false,
    notify = false,
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  install = {
    colorscheme = {
      'material-deep-ocean',
    },
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        'osc52',
        'gzip',
        'matchit',
        'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
        'spellfile',
        'rplugin',
        'editorconfig',
        'man',
      },
    },
  },
  rocks = {
    enabled = false,
  },
  pkg = {
    enabled = true,
    sources = { 'lazy' },
  },
})
