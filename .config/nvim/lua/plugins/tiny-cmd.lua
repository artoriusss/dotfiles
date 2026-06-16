return {
  {
    "rachartier/tiny-cmdline.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    init = function()
      vim.o.cmdheight = 0
    end,
    opts = {
      width = { min = 40, max = 60 },
      native_types = { "/", "?" }, 
    },
  }
}
