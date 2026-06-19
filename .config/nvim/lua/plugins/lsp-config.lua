vim.lsp.handlers["textDocument/signatureHelp"] = function() end
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ruff",
          "ty",
        },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = {
        lua_ls = {},
        ty = {},
        ruff = {},
      }
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Buffer Definition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: Buffer Code Action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })
    end,
  }
}
