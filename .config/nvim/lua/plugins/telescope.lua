return {
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close,
            },
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Telescope: Find Files" })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope: Live Grep" })
      vim.keymap.set('n', '<leader>s', builtin.lsp_dynamic_workspace_symbols, { desc = "Telescope: Workspace Symbols" })
      vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, { desc = "Telescope: All Buffer LSP Symbols" })
      
      vim.keymap.set('n', '<leader>b', function()
        builtin.buffers({
          layout_strategy = "bottom_pane",
          layout_config = {
            height = 0.4,
          },
        })
      end, { desc = "Telescope: Buffers (Bottom)" })

      vim.keymap.set('n', '<leader>tf', function()
        builtin.lsp_document_symbols({
          symbols = { "class", "function", "method" }
        })
      end, { desc = "Telescope: Buffer Functions & Classes" })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}

