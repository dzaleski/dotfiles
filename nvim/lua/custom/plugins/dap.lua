return {
  'mfussenegger/nvim-dap',
  dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio' },
  opts = {},
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    vim.keymap.set('n', '<Leader>du', dap.step_out, { desc = 'Step Out' })
    vim.keymap.set('n', '<Leader>di', dap.step_into, { desc = 'Step Into' })
    vim.keymap.set('n', '<Leader>do', dap.step_over, { desc = 'Step Over' })
    vim.keymap.set('n', '<Leader>dj', dap.continue, { desc = 'Continue Debugging' })
    vim.keymap.set('n', '<Leader>ds', dap.terminate, { desc = 'Stop Debugging' })

    vim.keymap.set('n', '<Leader>drb', dap.clear_breakpoints, { desc = 'Remove All Breakpoints' })
    vim.keymap.set('n', '<Leader>dp', dapui.toggle, { desc = 'Open Debug View' })

    vim.keymap.set('n', '<Leader>deb', function()
      dap.toggle_breakpoints(true)
    end, { desc = 'Enable All Breakpoints' })

    vim.keymap.set('n', '<Leader>ddb', function()
      dap.toggle_breakpoints(false)
    end, { desc = 'Disable All Breakpoints' })

    vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
  end,
}
