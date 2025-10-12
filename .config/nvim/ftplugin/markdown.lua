if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
  local map = function(mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, opts or { noremap=true, silent=true })
  end

  map("n", "<leader>zb", "<Cmd>ZkBacklinks<CR>")
  map("n", "<leader>zl", "<Cmd>ZkLinks<CR>")
end