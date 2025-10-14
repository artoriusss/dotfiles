return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.molten_wrap_output = true
            vim.g.molten_auto_open_output = false
            vim.g.molten_enter_output_behavior = "open_and_enter"
            -- vim.keymap.set("n", "<C-CR>", ":MoltenEvaluateLine<CR>", { silent=true, desc = "evaluate line"})
            vim.keymap.set("v", "<C-CR>", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true, desc = "evaluate visual selection" })
            -- vim.keymap.set("n", ";", ":MoltenShowOutput<CR>", { silent=true, desc = "show output"})
            -- vim.keymap.set("n", "q", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
            -- vim.keymap.set("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })
            -- vim.keymap.set("n", "<C-o>", ":MoltenNext<CR>", { silent = true, desc = "go to next cell" })
            -- vim.keymap.set("n", "<C-n>", ":MoltenPrev<CR>", { silent = true, desc = "go to previous cell" })
            -- vim.keymap.set("n", "<leader>mi", ":MoltenInterrupt<CR>", { desc = "interrupt currently running cell" })
            -- vim.keymap.set("n", "<leader>mr", ":MoltenRestart<CR>", { desc = "interrupt currently running cell" })
            -- vim.keymap.set("n", "<leader>mim", ":MoltenImagePopup<CR>", { desc = "open image output in a default file viewer" })
            -- vim.keymap.set('n', '<leader><CR>', ':MoltenReevaluateCell<CR>', { silent = true, desc = 're-evaluate cell' })
        end,
    },
    {
        "3rd/image.nvim",
        opts = {
            backend = "kitty",
            max_width = 300,
            max_height = 20,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_enabled = true,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        },
    }
}

