return {
  'phaazon/hop.nvim',
  branch = 'v2', -- optional but strongly recommended
  config = function()
    -- Hop setup
    require('hop').setup {

      keys = 'etovxqpdygfblzhckisuran', -- Define the hop keys
    }

    -- Custom key mappings
    -- Map `s` to HopWordAC (after cursor)
    vim.keymap.set('n', 's', '<cmd>HopWordAC<CR>', { noremap = true, silent = true })

    -- Map `S` to HopWordBC (before cursor)
    vim.keymap.set('n', 'S', '<cmd>HopWordBC<CR>', { noremap = true, silent = true })
  end,
}
