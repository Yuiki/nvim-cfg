return {
  "lewis6991/gitsigns.nvim",
  config = function ()
    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer = bufnr})
        vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer = bufnr})
        vim.keymap.set('n', '<leader>hd', gs.diffthis, {buffer = bufnr})
      end
    }
  end
}
