return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.files').setup()
      require("mini.comment").setup()
    end,
  }
}