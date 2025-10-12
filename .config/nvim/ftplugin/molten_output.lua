local map = function(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { buffer = true, desc = "Molten" }, opts or {}))
end
map("n", ";", function() vim.cmd("MoltenShowOutput") end,          { desc = "Molten: Show output" })
map("n", "q", function() vim.cmd("MoltenHideOutput") end,          { desc = "Molten: Hide output" })