return {
  'akinsho/bufferline.nvim',
  branch = 'main',
  -- version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.opt.termguicolors = true
    vim.opt.mousemoveevent = true
    vim.keymap.set('n', '<C-PageDown>', ':BufferLineCycleNext<CR>', { silent=true, noremap = true, desc = 'Next buffer (bufferline order)' })
    vim.keymap.set('n', '<C-PageUp>', ':BufferLineCyclePrev<CR>', { silent=true, noremap = true, desc = 'Previous buffer (bufferline order)' })
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
