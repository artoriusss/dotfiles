return {
  'akinsho/bufferline.nvim',
  branch = 'main',
  -- version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true
    local options = {
      hover = {
        enabled = true,
        delay = 100,
        reveal = {"close"}
      }
    }
    require("bufferline").setup({
      options = options
    })
  end
}
