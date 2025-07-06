return {
	"nvimdev/lspsaga.nvim",
	config = {
		lightbulb = {
			enable = false,
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" },
		{ "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
		{ "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
		{ "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
		{ "gpd", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
		{ "gt", "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto Type Definition" },
		{ "gpt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
		{ "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
		{ "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
	},
}
