return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		update_focused_file = {
			enable = true,
		},
		filters = {
			custom = { "^.git$" },
			git_ignored = false,
		},
		renderer = {
			group_empty = true,
		},
	},
	keys = {
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<CR>",
			desc = "Toggle Nvim Tree",
		},
	},
}
