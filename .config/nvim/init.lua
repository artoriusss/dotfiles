local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Sync terminal background with Neovim colorscheme
vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal or not normal.bg then return end
    -- Send OSC 11 to set terminal background to Neovim's Normal bg color
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

-- Reset terminal background when leaving Neovim
vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    -- Send OSC 111 to reset terminal background
    io.write("\027]111\027\\")
  end,
})

-- Ability to copy to system clipboard when on SSH
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}

-- Lazy.nvim
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath
  })

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.cmd("colorscheme blueberrypie")
require("vim-options")
require("lazy").setup("plugins")
