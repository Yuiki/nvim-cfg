return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Telescope find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Telescope live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Telescope buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Telescope help tags" },
    { "<leader>vc", "<cmd>Telescope git_commits<CR>", desc = "Telescope git commits" },
  },
}
