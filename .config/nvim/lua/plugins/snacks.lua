-- Always silenced, even when .gitignored files are toggled back on.
-- These go straight to fd/rg as excludes, independent of the ignore setting.
local exclude = {
  ".git",
  "node_modules",
  ".venv",
  "venv",
  "__pycache__",
  ".mypy_cache",
  ".pytest_cache",
  ".ruff_cache",
  "*.pyc",
  ".DS_Store",
}

return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
      timeout = 4000,
    },
    picker = {
      ui_select = true, -- replace vim.ui.select
      sources = {
        buffers = { sort_lastused = true },
        files = { exclude = exclude },
        grep = { exclude = exclude },
      },
      win = {
        input = {
          keys = {
            -- close immediately on <Esc> instead of going to normal mode
            ["<Esc>"] = { "close", mode = { "n", "i" } },
          },
        },
      },
    },
    styles = {
      notification = {
        focusable = true,
      }
    }
  },
  keys = {
    { "<leader>.n", function() Snacks.notifier.show_history() end, desc = "Notification History Buffer" },

    -- Picker
    { "<C-p>",      function() Snacks.picker.files({ ignored = vim.g.snacks_ignored }) end, desc = "Pick: Find Files" },
    { "<leader>fg", function() Snacks.picker.grep({ ignored = vim.g.snacks_ignored }) end, desc = "Pick: Live Grep" },
    {
      "<leader>ti",
      function()
        vim.g.snacks_ignored = not vim.g.snacks_ignored
        Snacks.notify((vim.g.snacks_ignored and "Including" or "Excluding") .. " .gitignored files", { title = "Picker" })
      end,
      desc = "Pick: Toggle .gitignored files (session)",
    },
    { "<leader>b",  function() Snacks.picker.buffers({ current = false }) end, desc = "Pick: Buffers" },
    { "<leader>s",  function() Snacks.picker.lsp_workspace_symbols() end, desc = "Pick: Workspace Symbols" },
    { "<leader>ts", function() Snacks.picker.lsp_symbols() end, desc = "Pick: Document Symbols" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Pick: Keymaps" },
    {
      "<leader>tf",
      function() Snacks.picker.lsp_symbols({ filter = { default = { "Class", "Function", "Method" } } }) end,
      desc = "Pick: Functions & Classes",
    },
  }
}
