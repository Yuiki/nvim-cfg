return {
	"mason-org/mason-lspconfig.nvim",
	event = "BufReadPre",
	opts = {
		ensure_installed = {
			"ts_ls",
			"denols",
			"lua_ls",
			"biome",
			"terraformls",
			"kotlin_lsp",
			"cssls",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	keys = {
		{ "<leader>lr", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP Info" },
		{ "<leader>ll", "<cmd>LspLog<cr>", desc = "LSP Log" },
	},
	config = function(_, opts)
		require("mason-lspconfig").setup(opts)

		local nvim_lsp = require("lspconfig")
		vim.lsp.config("ts_ls", {
			root_dir = nvim_lsp.util.root_pattern("package.json"),
			single_file_support = false,
			settings = {
				typescript = {
					inlayHints = {
						includeInlayParameterNameHints = "literals",
						includeInlayVariableTypeHints = true,
						-- includeInlayFunctionLikeReturnTypeHints = true,
					},
				},
			},
		})

		vim.lsp.config("biome", {
			root_dir = nvim_lsp.util.root_pattern("biome.json", "biome.jsonc"),
			single_file_support = false,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					local augroup = vim.api.nvim_create_augroup("BiomeFormatting", {})
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,
}
