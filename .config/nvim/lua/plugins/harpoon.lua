return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
      { desc = "Harpoon: add file" })
    vim.keymap.set("n", "<leader>m", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon: toggle menu" })

    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: file 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: file 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: file 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: file 4" })

    -- Cycle through harpoon list (previous/next)
    -- vim.keymap.set("n", "<C-S-p>", function() harpoon:list():prev() end,
    --   { desc = "Harpoon: previous file" })
    vim.keymap.set("n", "<C-S-f>", function() harpoon:list():next() end,
      { desc = "Harpoon: next file" })
  end,
}
