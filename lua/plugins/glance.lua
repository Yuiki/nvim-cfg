return {
	"dnlhc/glance.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local glance = require("glance")
		glance.setup({
			border = {
				enable = true,
			},
			hooks = {
				before_open = function(results, open, jump, method)
					if #results == 1 then
						jump(results[1])
						return false
					end
					return true
				end,
			},
		})
	end,
	keys = {
		{ "gd", "<cmd>Glance definitions<cr>", desc = "Peek Definition" },
		{ "gt", "<cmd>Glance type_definitions<cr>", desc = "Peek Type Definition" },
		{ "gR", "<cmd>Glance references<cr>", desc = "Peek References" },
		{ "gri", "<cmd>Glance implementations<cr>", desc = "Peek Implementation" },
	},
}
