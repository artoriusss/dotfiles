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

-- For iron.nvim: insert a new cell block
vim.api.nvim_set_keymap('n', '<leader>cc', 'o#%%<Esc>^d0', { noremap = true })

vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<C-o>', ':BufferLineCycleNext<CR>', { noremap = true, desc = 'Next buffer (bufferline order)' })
vim.keymap.set('n', '<C-n>', ':BufferLineCyclePrev<CR>', { noremap = true, desc = 'Previous buffer (bufferline order)' })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics in popup at cursor" })
vim.keymap.set('n', '<leader>w', ':write<CR>', { noremap = true, desc = 'Save file' })
vim.g.slime_target = "kitty"
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.g.slime_target = "kitty"
--     -- Optionally, prompt for window ID or set defaults
--     vim.cmd("SlimeConfig")
--   end,
-- })