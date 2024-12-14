return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    size = 20, -- Default terminal size
    open_mapping = [[<c-\>]], -- Use Ctrl+\ to toggle terminal
    direction = 'float', -- Set terminal to float mode
    shade_filetypes = { 'nofile' }, -- Prevent shading for certain filetypes
    close_on_exit = true, -- Close terminal automatically when command finishes
    shell = vim.o.shell, -- Use the default shell
    float_opts = {
      border = 'single', -- Border style for floating terminal
      winblend = 3, -- Transparency for floating terminal
    },
  },
}
