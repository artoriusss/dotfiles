return {
  "voldikss/vim-floaterm",
  config = function()
    vim.keymap.set('n', '<F10>', ':FloatermToggle<CR>', { noremap = true, desc = 'Toggle floating terminal' })
    vim.keymap.set('n', '<leader>tn', ':FloatermNew<CR>', { noremap = true, desc = 'New floating shell' })
    
    vim.keymap.set('t', '<F8>', '<C-\\><C-n>:FloatermPrev<CR>', { noremap = true, desc = 'Toggle floating terminal in terminal mode' })
    vim.keymap.set('t', '<F9>', '<C-\\><C-n>:FloatermNew<CR>', { noremap = true, desc = 'Toggle floating terminal in terminal mode' })
    vim.keymap.set('t', '<F10>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true, desc = 'Toggle floating terminal in terminal mode' })
    vim.keymap.set('t', '<F11>', '<C-\\><C-n>:FloatermNext<CR>', { noremap = true, desc = 'Toggle floating terminal in terminal mode' })
    vim.keymap.set('t', '<F12>', '<C-\\><C-n>:FloatermKill<CR>', { noremap = true, desc = 'Toggle floating terminal in terminal mode' })
  end,
}