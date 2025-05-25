return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        auto_expand_width = true,
        width = 30,
        max_width = 80,
      },
    })
    local function focus_or_reveal()
      local neo_win       = nil
      local current_win   = vim.api.nvim_get_current_win()

      -- look for an existing Neo-tree window
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf  = vim.api.nvim_win_get_buf(win)
        local ftyp = vim.api.nvim_buf_get_option(buf, "filetype")
        if ftyp == "neo-tree" then
          neo_win = win
          break
        end
      end

      if neo_win then                       -- Neo-tree is open somewhere
        if neo_win == current_win then      --  … and we are inside it
          vim.cmd("wincmd p")               -- go back to previous window
        else
          vim.api.nvim_set_current_win(neo_win) -- jump into tree
        end
      else                                  -- Neo-tree not visible → open it
        vim.cmd("Neotree filesystem reveal left")
      end
    end
    -- vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left <CR>', {})
    -- 1. Pure *open / close* toggle (keeps current window untouched)
    vim.keymap.set('n', '<leader>b', ':Neotree filesystem toggle left<CR>',
                   { desc = 'Toggle Neo-tree sidebar' })

    -- 2. “Focus or reveal” mapping
    vim.keymap.set('n', '<C-,>', focus_or_reveal,
                   { desc = 'Jump to / from Neo-tree' })

    vim.keymap.set('n', '<leader>t', function()
      vim.cmd('Neotree toggle source=buffers')
    end, { desc = 'Toggle Neo-tree Buffers' })

    vim.keymap.set('n', '<leader>b', function()
      vim.cmd('Neotree toggle')
    end, { desc = 'Toggle NeoTree' })
  end
}
