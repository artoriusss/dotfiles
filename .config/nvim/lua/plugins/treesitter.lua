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

      -- IMPROVED: Guarded Autocommand
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- Get the filetype of the current buffer
          local ft = vim.bo[args.buf].filetype
          
          -- 1. Check if a parser exists for this filetype
          local has_parser = pcall(vim.treesitter.get_parser, args.buf)
          
          -- 2. Only start if a parser exists and it's a "normal" filetype
          -- We filter out common non-file buffers explicitly just in case
          local excluded = { "snacks_notif", "snacks_win", "blink-cmp-menu", "cmd" }
          
          if has_parser and not vim.tbl_contains(excluded, ft) then
            pcall(vim.treesitter.start, args.buf)
            
            -- Set indentation if it's not a special buffer
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
