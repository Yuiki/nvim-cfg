return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			offsets = {
				{
					filetype = "NvimTree",
					text = "Explorer",
					highlight = "Directory",
					separator = true,
				},
			},
		},
	},
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
		{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Close buffers to the right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Close buffers to the left" },
		{ "<leader>bd", "<Cmd>bdelete<CR>", desc = "Close current buffer" },
	},
}
