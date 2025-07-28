return {
	"akinsho/toggleterm.nvim",
	opts = {
		open_mapping = [[<c-\>]],
		size = 20,
    persist_size = false,
		auto_scroll = false,
	},
	keys = {
		{ "<c-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
		{ "<c-n>", "[[<C-t><C-n>]]", desc = "Toggle terminal in normal mode" },
	},
}
