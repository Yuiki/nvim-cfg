return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"lua",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"json",
			"terraform",
			"kotlin",
			"markdown",
			"markdown_inline",
		},
		sync_install = false,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
