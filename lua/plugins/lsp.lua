return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = { "ts_ls", "lua_ls", "biome", "terraformls", "kotlin_lsp", "cssls" },
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)

		vim.lsp.config("ts_ls", {
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "literals",
						includeInlayVariableTypeHints = true,
						includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
			},
		})
	end,
}
