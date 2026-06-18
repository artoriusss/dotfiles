-- File: lua/plugins/treesitter.lua
return {
  {
    "romus204/tree-sitter-manager.nvim",
    lazy = false,
    config = function()
      require("tree-sitter-manager").setup({
        ensure_installed = {
          "lua", "python", "markdown", "markdown_inline", "vim", "bash", "json", "yaml"
        },
      })

      vim.opt.runtimepath:append(require("tree-sitter-manager.util").PLUGIN_ROOT .. "/runtime")

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local has_parser = pcall(vim.treesitter.get_parser, args.buf)
          local excluded = { "snacks_notif", "snacks_win", "blink-cmp-menu", "cmd" }
          if has_parser and not vim.tbl_contains(excluded, ft) then
            pcall(vim.treesitter.start, args.buf)
            local ok, indent = pcall(vim.treesitter.indentexpr)
            if ok then
              vim.bo[args.buf].indentexpr = "v:lua.vim.treesitter.indentexpr()"
            end
          end
        end,
      })
    end,
  }
}
