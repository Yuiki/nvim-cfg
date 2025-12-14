return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	opts = {
		open_mapping = [[<c-\>]],
		size = 25,
		persist_size = false,
		auto_scroll = false,
	},
	keys = {
		{ "<c-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
	},
}
