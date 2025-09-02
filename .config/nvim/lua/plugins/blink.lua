return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = {
    keymap = {
      preset = 'default',
      ['<CR>'] = { 'accept', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = {
        auto_show = false,
      },
      trigger = {
        show_on_trigger_character = true,
      },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "rust" },
    cmdline = {
      keymap = { preset = "super-tab" },
      completion = { menu = { auto_show = true } },
    },
  },
  opts_extend = { "sources.default" },
}
