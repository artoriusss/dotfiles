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
    { "<C-p>",      function() Snacks.picker.files() end,                   desc = "Pick: Find Files" },
    { "<leader>fg", function() Snacks.picker.grep() end,                    desc = "Pick: Live Grep" },
    { "<leader>b",  function() Snacks.picker.buffers() end,                 desc = "Pick: Buffers" },
    { "<leader>s",  function() Snacks.picker.lsp_workspace_symbols() end,   desc = "Pick: Workspace Symbols" },
    { "<leader>ts", function() Snacks.picker.lsp_symbols() end,            desc = "Pick: Document Symbols" },
    {
      "<leader>tf",
      function() Snacks.picker.lsp_symbols({ filter = { default = { "Class", "Function", "Method" } } }) end,
      desc = "Pick: Functions & Classes",
    },
  }
}
