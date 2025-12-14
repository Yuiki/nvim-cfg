return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		current_line_blame = true,
		current_line_blame_opts = {
			delay = 300,
		},
	},
	keys = {
		{ "<leader>vb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame Line" },
	},
}
