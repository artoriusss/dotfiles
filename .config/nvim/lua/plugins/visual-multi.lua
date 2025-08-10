return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- Zed-style keymaps with <leader>g l / <leader>g L and <leader>g a
    vim.g.VM_maps = {
      ['Find Under'] = '<leader>gl',
      ['Find Subword Under'] = '<leader>gl',
      ['Select All'] = '<leader>ga',
      ['Find Prev'] = '<leader>gL',
    }
    vim.g.VM_set_statusline = 1 -- optional: leave your own statusline untouched
  end,
}