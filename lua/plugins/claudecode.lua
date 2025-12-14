return {
  -- Snacks.nvim dependency for terminal functionality
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },

  -- Claude Code integration
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Open Claude Code" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude Code" },
    },
  },
}
