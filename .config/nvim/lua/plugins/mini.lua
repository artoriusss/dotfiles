return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.files').setup({
          mappings = {
            go_in = '<Right>',
            go_out = '<Left>',
            go_in_plus = '<S-Right>',
            go_out_plus = '<S-Left>'
          }
      })

      require("mini.comment").setup()
      require("mini.surround").setup()
      require("mini.pairs").setup()

      local ai = require("mini.ai")
      ai.setup({
        n_lines = 500,
        custom_textobjects = {
          ["="] = ai.gen_spec.treesitter({ a = "@assignment.outer", i = "@assignment.inner" }),
          ["L"] = ai.gen_spec.treesitter({ a = "@assignment.lhs",   i = "@assignment.lhs" }),
          ["R"] = ai.gen_spec.treesitter({ a = "@assignment.rhs",   i = "@assignment.rhs" }),
          ["a"] = ai.gen_spec.treesitter({ a = "@parameter.outer",  i = "@parameter.inner" }),
          ["i"] = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }),
          ["l"] = ai.gen_spec.treesitter({ a = "@loop.outer",        i = "@loop.inner" }),
          ["f"] = ai.gen_spec.treesitter({ a = "@call.outer",        i = "@call.inner" }),
          ["m"] = ai.gen_spec.treesitter({ a = "@function.outer",    i = "@function.inner" }),
          ["c"] = ai.gen_spec.treesitter({ a = "@class.outer",       i = "@class.inner" }),
        }
      })

      local select_capture = function(id)
        local region = ai.find_textobject("a", id)
        if region then
          vim.api.nvim_win_set_cursor(0, { region.from.line, region.from.col - 1 })
          if not vim.api.nvim_get_mode().mode:match("[vV]") then
            vim.cmd("normal! v")
          end
          vim.api.nvim_win_set_cursor(0, { region.to.line, region.to.col - 1 })
        end
      end

      vim.keymap.set({"x", "o"}, "l=", function() select_capture("L") end, { desc = "Select left hand side of an assignment" })
      vim.keymap.set({"x", "o"}, "r=", function() select_capture("R") end, { desc = "Select right hand side of an assignment" })

      -- mini.pick
      local pick = require('mini.pick')
      pick.setup()
      require('mini.extra').setup()
      vim.ui.select = pick.ui_select

      local function pick_lsp(scope)
        return function() MiniExtra.pickers.lsp({ scope = scope }) end
      end

      vim.keymap.set('n', '<C-p>', pick.builtin.files, { desc = 'Pick: Find Files' })
      vim.keymap.set('n', '<leader>fg', pick.builtin.grep_live, { desc = 'Pick: Live Grep' })
      vim.keymap.set('n', '<leader>s', pick_lsp('workspace_symbol_live'), { desc = 'Pick: Workspace Symbols' })
      vim.keymap.set('n', '<leader>ts', pick_lsp('document_symbol'), { desc = 'Pick: Document Symbols' })

      vim.keymap.set('n', '<leader>b', function()
        pick.builtin.buffers({ sort_lastused = true }, {
          window = {
            config = function()
              local height = math.floor(0.4 * vim.o.lines)
              return {
                anchor = 'SW',
                row = vim.o.lines - 1,
                col = 0,
                width = vim.o.columns,
                height = height,
              }
            end,
          },
        })
      end, { desc = 'Pick: Buffers (Bottom)' })

      vim.keymap.set('n', '<leader>tf', function()
        local kinds = { Class = true, Function = true, Method = true }
        local bufnr = vim.api.nvim_get_current_buf()
        vim.lsp.buf.document_symbol({
          on_list = function(args)
            local items = vim.tbl_filter(function(it) return kinds[it.kind] end, args.items)
            for _, it in ipairs(items) do
              it.bufnr = bufnr
            end
            if vim.tbl_isempty(items) then
              return vim.notify('No classes, functions, or methods found', vim.log.levels.INFO)
            end
            pick.start({ source = { items = items, name = 'Functions & Classes' } })
          end,
        })
      end, { desc = 'Pick: Buffer Functions & Classes' })

    end,
  }
}
