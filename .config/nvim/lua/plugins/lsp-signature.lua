return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
  require("lsp_signature").setup({
    floating_window = false,
    hint_prefix = " ",
    toggle_key = "<C-s>",
    bind = true,
    doc_lines = 0,
    auto_trigger = false,
  })
  end,
}