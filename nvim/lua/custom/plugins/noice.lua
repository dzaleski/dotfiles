return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  enabled = false,
  opts = {
    cmdline = {
      enabled = true, -- Disable the cmdline popup
    },
    search = {
      enabled = true, -- Disable search popups
    },
    messages = {
      enabled = false, -- Disable message popups
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
