return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>ff', "<cmd>Telescope find_files<cr>" },
    { '<leader>fg', "<cmd>Telescope live_grep<cr>" },
    { '<leader>fb', "<cmd>Telescope buffers<cr>" },
    { '<leader>fh', "<cmd>Telescope help_tags<cr>" }
  }
}