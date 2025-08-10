vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable Vi compatibility mode
vim.opt.compatible = false

-- Enable highlighting of the current line
vim.opt.cursorline = true

-- Show line numbers
vim.opt.number = true

-- Configure backspace behavior
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Display incomplete commands
vim.opt.showcmd = true

-- Display the current mode in the command line
vim.opt.showmode = true

-- Automatically read files when changed outside of Neovim
vim.opt.autoread = true

-- Allow switching between unsaved buffers
vim.opt.hidden = true

-- Always display the status line
vim.opt.laststatus = 2

-- Show the cursor position
vim.opt.ruler = true

-- Enable command-line completion
vim.opt.wildmenu = true

-- Show relative line numbers
vim.opt.relativenumber = true

-- Disable error bells
vim.opt.errorbells = false

-- Enable visual bell instead of beeping
vim.opt.visualbell = true

-- Enable mouse support in all modes
vim.opt.mouse = 'a'

-- Set background color scheme
vim.opt.background = 'dark'

-- Set the window title to the filename
vim.opt.title = true

-- Disable swap file creation
vim.opt.swapfile = false

-- Disable backup file creation
vim.opt.backup = false

-- Disable write backup
vim.opt.writebackup = false

-- Enable automatic indentation
vim.opt.autoindent = true

-- Enable file type detection and load related plugins and indent settings
vim.cmd('filetype plugin indent on')

-- Set the number of spaces a <Tab> counts for
vim.opt.tabstop = 4

-- Set the number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Configure the status line
vim.opt.statusline = '%F%m%r%h%w%=(%{&ff}/%Y)\\ (line\\ %l/%L,\\ col\\ %c)'

-- Keep 5 lines visible above and below the cursor
vim.opt.scrolloff = 5

-- Set the directory for undo files
vim.opt.undodir = vim.fn.expand('~/.vim/undodir')

-- Enable persistent undo
vim.opt.undofile = true

-- I find auto open annoying, keep in mind setting this option will require setting
-- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
vim.g.molten_auto_open_output = false

-- this guide will be using image.nvim
-- Don't forget to setup and install the plugin if you want to view image outputs
vim.g.molten_image_provider = "image.nvim"

-- optional, I like wrapping. works for virt text and the output window
vim.g.molten_wrap_output = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.keymap.set("n","<Esc>", "<cmd>nohlsearch<CR>", {silent=true})
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.keymap.set("n","Y","y$")

-- Output as virtual text. Allows outputs to always be shown, works with images, but can
-- be buggy with longer images
-- vim.g.molten_virt_text_output = true

-- this will make it so the output shows up below the \`\`\` cell delimiter
-- vim.g.molten_virt_lines_off_by_1 = true


vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<C-PageDown>', ':BufferLineCycleNext<CR>', { silent=true, noremap = true, desc = 'Next buffer (bufferline order)' })
vim.keymap.set('n', '<C-PageUp>', ':BufferLineCyclePrev<CR>', { silent=true, noremap = true, desc = 'Previous buffer (bufferline order)' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics in popup at cursor" })
vim.keymap.set('n', '<leader>w', ':write<CR>', { silent=true, noremap = true, desc = 'Save file' })
vim.keymap.set('n', '<leader>b', function()
  require('mini.files').open()
end, { desc = 'Open mini.files' })
