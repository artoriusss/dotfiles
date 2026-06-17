return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    notifier = {
      enabled = true,
      timeout = 4000,
    },
    styles = {
      notification = {
        focusable = true,
      }
    }
  },
  keys = {
    { "<leader>.n", function() Snacks.notifier.show_history() end, desc = "Notification History Buffer" },
  }
}
