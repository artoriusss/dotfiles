return {
  "zk-org/zk-nvim",
  config = function()
    require("zk").setup({
      picker = "telescope",

      lsp = {
        config = {
          name = "zk",
          cmd = { "zk", "lsp" },
          filetypes = { "markdown" },
        },

        -- automatically attach buffers in a zk notebook that match the given filetypes
        auto_attach = {
          enabled = true,
        },
      },
    })
  end,
}
