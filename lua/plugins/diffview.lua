return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>vd",
      function()
        local view = require("diffview.lib").get_current_view()
        if view then
          vim.cmd("DiffviewClose")
        else
          vim.cmd("DiffviewOpen")
        end
      end,
      desc = "Toggle Diffview",
    },
    { "<leader>vh", "<cmd>DiffviewFileHistory --no-merges %<cr>", desc = "File History" },
  },
  config = function(_, opts)
    require("diffview").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "DiffviewFiles",
      callback = function()
        vim.cmd("cnoreabbrev <buffer> q DiffviewClose")
      end,
    })
  end,
}
