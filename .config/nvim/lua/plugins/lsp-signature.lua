return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {}, -- use defaults, customize as needed
  config = function()
    require("lsp_signature").setup({
      floating_window = true,
      hint_prefix = " ", -- or any emoji/icon you like
      -- You can tweak more options, see plugin README
    })
  end
}