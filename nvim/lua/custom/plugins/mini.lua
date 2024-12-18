return {
  {
    'echasnovski/mini.diff',
    opts = {},
    version = 'false',
    config = function()
      require('mini.ai').setup()
    end,
  },
  {
    'echasnovski/mini.ai',
    opts = {},
    version = 'false',
    config = function()
      require('mini.ai').setup()
    end,
  },
  {
    'echasnovski/mini.files',
    version = 'false',
    config = function()
      require('mini.files').setup {
        {
          content = {
            -- Predicate for which file system entries to show
            filter = nil,
            -- What prefix to show to the left of file system entry
            prefix = nil,
            -- In which order to show file system entries
            sort = nil,
          },

          -- Module mappings created only inside explorer.
          -- Use `''` (empty string) to not create one.
          mappings = {
            close = 'q',
            go_in = 'l',
            go_in_plus = 'L',
            go_out = 'h',
            go_out_plus = 'H',
            mark_goto = "'",
            mark_set = 'm',
            reset = '<BS>',
            reveal_cwd = '@',
            show_help = 'g?',
            synchronize = '=',
            trim_left = '<',
            trim_right = '>',
          },

          options = {
            -- Whether to delete permanently or move into module-specific trash
            permanent_delete = false,
            -- Whether to use for editing directories
            use_as_default_explorer = true,
          },

          -- Customization of explorer windows
          windows = {
            -- Maximum number of windows to show side by side
            max_number = math.huge,
            -- Whether to show preview of file/directory under cursor
            preview = false,
            -- Width of focused window
            width_focus = 50,
            -- Width of non-focused window
            width_nofocus = 15,
            -- Width of preview window
            width_preview = 25,
          },
        },
      }

      local function open_current_file_directory()
        local current_file = vim.api.nvim_buf_get_name(0)
        local current_directory = vim.fn.fnamemodify(current_file, ':h')
        require('mini.files').open(current_directory)
      end

      -- Set the keymap to call the function
      vim.keymap.set('n', '-', open_current_file_directory, { desc = 'Open current file directory' })
      vim.keymap.set('n', '<Leader>ef', open_current_file_directory, { desc = 'Open current file directory' })
    end,
  },
}
