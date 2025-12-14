return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"zbirenbaum/copilot-cmp",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			sources = {
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp", group_index = 2 },
			},
			mapping = cmp.mapping.preset.insert({
				["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<CR>"] = cmp.mapping.confirm(),
				["<Esc>"] = cmp.mapping.abort(),
			}),
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
		})
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
	end,
}
