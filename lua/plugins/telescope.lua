return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
		{ "<leader>vc", "<cmd>Telescope git_commits<CR>", desc = "Telescope git commits" },
	},
	opts = {
		defaults = {
			get_selection_window = function()
				local wins = vim.api.nvim_list_wins()
				table.insert(wins, 1, vim.api.nvim_get_current_win())
				for _, win in ipairs(wins) do
					local buf = vim.api.nvim_win_get_buf(win)
					if vim.bo[buf].buftype == "" then
						return win
					end
				end
				return 0
			end,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!**/.git/*",
				"--glob=!**/node_modules/*",
			},
			file_ignore_patterns = {
				"^.git/",
				"node_modules/",
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},
}
