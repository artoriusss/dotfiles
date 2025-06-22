return {  "jpalardy/vim-slime",
  init = function()
    -- These must be set BEFORE the plugin loads
    vim.g.slime_target = "neovim"
    vim.g.slime_no_mappings = true
  end,
  config = function()
    vim.g.slime_input_pid = false
    vim.g.slime_suggest_default = true
    vim.g.slime_menu_config = false
    vim.g.slime_neovim_ignore_unlisted = false

    -- Keymaps for sending code
    vim.keymap.set("n", "gz", "<Plug>SlimeMotionSend", { remap = true, silent = false })
    vim.keymap.set("n", "<D-Enter>", "<Plug>SlimeLineSend", { remap = true, silent = false })
    vim.keymap.set("x", "<C-Enter>", "<Plug>SlimeRegionSend", { remap = true, silent = false })
    -- vim.keymap.set("n", "gzc", "<Plug>SlimeConfig", { remap = true, silent = false })
  end,
}