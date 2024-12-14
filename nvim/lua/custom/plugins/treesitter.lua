return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
  config = function()
    local ts_utils = require 'nvim-treesitter.ts_utils'

    local function copy_json_path()
      local result = {}
      local node = ts_utils.get_node_at_cursor()

      while node do
        if tostring(node) == '<node pair>' then
          local key_node = node:named_child(0):named_child(0) -- Get the key node of the pair
          if key_node then
            local key_text = ts_utils.get_node_text(key_node)[1]
            table.insert(result, 1, key_text) -- Add to the path in reverse order
          end
        end
        node = node:parent() -- Traverse to the parent node
      end

      if #result > 0 then
        local json_path = "'" .. table.concat(result, '.') .. "'"
        vim.fn.setreg('+', json_path)
        print('Copied JSON path: ' .. json_path)
      else
        print 'No JSON key found under cursor!'
      end
    end

    vim.keymap.set('n', '<leader>cjp', copy_json_path, { desc = 'Copy JSON path to clipboard' })
  end
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
