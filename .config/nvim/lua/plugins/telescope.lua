return {
      {
        'nvim-telescope/telescope.nvim', 
        branch = 'master',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
          local builtin = require("telescope.builtin")
          vim.keymap.set('n', '<C-p>', builtin.find_files, {})
          vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
          
          -- All LSP Document Symbols
          vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, { desc = "Telescope: All LSP Symbols" })
          
          -- Filtered LSP Document Symbols (Functions & Classes)
          vim.keymap.set('n', '<leader>tf', function()
            builtin.lsp_document_symbols({
              symbols = { "class", "function", "method" }
            })
          end, { desc = "Telescope: Functions & Classes" })

          -- Interactive Workspace Symbols
          vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, { desc = "Telescope: Workspace Symbols" })
        end
      },
      {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
          require("telescope").setup({
            extensions = {
              ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                }
              }
            }
          })
          require("telescope").load_extension("ui-select")
        end
      }
    }
