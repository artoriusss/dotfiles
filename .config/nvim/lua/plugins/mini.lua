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
      vim.cmd("colorscheme minicyan")

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
    end,
  }
}
