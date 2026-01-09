return {
	"akinsho/toggleterm.nvim",
	lazy = false,
	opts = {
		open_mapping = [[<c-\>]],
		size = 25,
		persist_size = false,
		auto_scroll = false,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "rounded",
			},
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
		})

		vim.keymap.set("n", "<leader>gg", function()
			lazygit:toggle()
		end, { desc = "Lazygit" })
	end,
	keys = {
		{ "<c-\\>", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
	},
}
