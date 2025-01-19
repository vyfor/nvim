local datapath = vim.fn.stdpath 'data'
local lazypath = datapath .. '/lazy/lazy.nvim'

vim.api.nvim_create_user_command('LazyInit', function()
  vim.uv.fs_stat(lazypath, function(err)
    if err then
      vim.notify 'Installing lazy.nvim...'
      vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
      }
    else
      vim.notify 'Lazy.nvim is already installed!'
    end
  end)
end, { nargs = 0 })

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
