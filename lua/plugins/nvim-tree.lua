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
		git = {
			enable = true,
			ignore = false,
		},
		renderer = {
			group_empty = true,
			highlight_git = true,
			icons = {
				show = {
					git = true,
				},
			},
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
