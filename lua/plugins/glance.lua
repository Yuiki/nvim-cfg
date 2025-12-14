return {
	"dnlhc/glance.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local glance = require("glance")
		glance.setup({
			border = {
				enable = true,
			},
		})
	end,
	keys = {
		{ "gD", "<cmd>Glance definitions<cr>", desc = "Peek Definition" },
		{ "gY", "<cmd>Glance type_definitions<cr>", desc = "Peek Type Definition" },
		{ "gR", "<cmd>Glance references<cr>", desc = "Peek References" },
		{ "gM", "<cmd>Glance implementations<cr>", desc = "Peek Implementation" },
	},
}
