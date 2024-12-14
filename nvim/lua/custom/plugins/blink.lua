return {
  'saghen/blink.cmp',
  event = { 'LspAttach' },
  dependencies = {
    'folke/lazydev.nvim',
    { 'rafamadriz/friendly-snippets' },
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  version = 'v0.*',
  opts = {
    keymap = {
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<Tab>'] = { 'select_and_accept' },
      ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' },
      -- ['Tab'] = { 'snippet_forward', 'fallback' },
      -- ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
    },
    sources = {
      completion = {
        enabled_providers = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
      },
      providers = {
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' },
      },
    },

    completion = {
      accept = { auto_brackets = { enabled = true } },
      menu = {
        border = vim.g.border_style,
        scrolloff = 1,
        scrollbar = false,
        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 0 } },

        draw = {
          padding = 0,
          gap = 1,
          treesitter = true,
        },
      },

      documentation = {
        auto_show_delay_ms = 0,
        auto_show = true,
        window = {
          border = vim.g.border_style,
        },
      },
    },

    signature = {
      enabled = false,
      border = 'single',
    },
  },
}
