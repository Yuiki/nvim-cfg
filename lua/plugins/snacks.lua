return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- Enable scratch functionality
		scratch = {
			enabled = true,
		},
		-- Other commonly used features
		bigfile = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		statuscolumn = { enabled = false },
		words = { enabled = true },
		input = { enabled = true },
	},
	keys = {
		{
			"<leader>.",
			function()
				require("snacks").scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				require("snacks").scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>sm",
			function()
				require("snacks").scratch({ ft = "markdown" })
			end,
			desc = "Scratch Buffer (Markdown)",
		},
	},
}
