return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>vd", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
		{ "<leader>vD", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
		{ "<leader>vh", "<cmd>DiffviewFileHistory --no-merges %<cr>", desc = "File History" },
	},
	config = function(_, opts)
		require("diffview").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "DiffviewFiles",
			callback = function()
         vim.cmd("cnoreabbrev <buffer> q DiffviewClose")
			end,
		})
	end,
}
