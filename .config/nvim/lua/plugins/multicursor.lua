return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0", -- pinned stable branch
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    -- gl: add a cursor on the NEXT occurrence of the word under cursor
    -- (or the current visual selection). First press selects the word
    -- under the cursor and jumps the main cursor to the next match.
    vim.keymap.set({ "n", "x" }, "gl", function()
      mc.matchAddCursor(1)
    end, { desc = "Multicursor: add cursor on next match" })

    -- Keymaps active ONLY while multiple cursors exist (non-invasive).
    mc.addKeymapLayer(function(layerSet)
      -- clear all extra cursors, back to single cursor
      layerSet("n", "<esc>", mc.clearCursors)
      -- optional: cycle between cursors
      layerSet("n", "<left>", mc.prevCursor)
      layerSet("n", "<right>", mc.nextCursor)
    end)
  end,
}
