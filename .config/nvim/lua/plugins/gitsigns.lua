return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")

    gitsigns.setup({
      on_attach = function(bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        -- Navigation between hunks
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Gitsigns: next hunk")

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Gitsigns: previous hunk")

        -- Actions
        map("n", "<leader>hs", gitsigns.stage_hunk, "Gitsigns: stage hunk")
        map("n", "<leader>hr", gitsigns.reset_hunk, "Gitsigns: reset hunk")
        map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
          "Gitsigns: stage hunk")
        map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
          "Gitsigns: reset hunk")
        map("n", "<leader>hS", gitsigns.stage_buffer, "Gitsigns: stage buffer")
        map("n", "<leader>hR", gitsigns.reset_buffer, "Gitsigns: reset buffer")
        map("n", "<leader>hp", gitsigns.preview_hunk, "Gitsigns: preview hunk")
        map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, "Gitsigns: blame line")
        map("n", "<leader>hd", gitsigns.diffthis, "Gitsigns: diff against index")

        -- Toggles
        map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Gitsigns: toggle line blame")
        map("n", "<leader>td", gitsigns.toggle_deleted, "Gitsigns: toggle deleted")
      end,
    })
  end,
}
