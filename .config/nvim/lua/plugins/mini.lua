return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.files').setup({
        mappings = {
          go_in = '<Right>',
          go_out = '<Left>',
          go_in_plus = '<S-Right>',
          go_out_plus = '<S-Left>'
        }
      })
      require("mini.comment").setup()
      require("mini.surround").setup()
    end,
  }
}

