return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim' },
  config = function ()
    vim.keymap.set('n', '<leader>gs', '<cmd>Telescope git_status<CR>')
    vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_commits<CR>')
  end
}
