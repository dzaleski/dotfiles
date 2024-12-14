return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = false,
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter' }, -- Ensure nvim-treesitter is installed
  },
  config = function()
    -- Setup nvim-treesitter-context
    require('treesitter-context').setup {
      enable = true, -- Enable the plugin
      throttle = true, -- Throttle updates for performance
      max_lines = 0, -- No limit for how many lines the context should span (set 0 for no limit)
      trim_scope = 'outer', -- Discard the context lines if `max_lines` is exceeded. Options: "inner" or "outer"
      patterns = {
        default = {
          'class', -- Shows class names
          'function', -- Shows function names
          'method', -- Shows method names
        },
      },
      exact_patterns = {},
      zindex = 20, -- Controls the zindex for the context window
    }
  end,
}
