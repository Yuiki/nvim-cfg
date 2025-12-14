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
		-- Setup additional LSP keymaps (complement Neovim 0.10+ defaults)
		-- Defaults: grn (rename), gra (code action), grr (references), gri (implementation)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
				end

				-- Additional LSP actions (not in defaults)
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gd", vim.lsp.buf.definition, "Goto Definition")
				map("gt", vim.lsp.buf.type_definition, "Goto Type Definition")

				-- Diagnostics navigation
				map("[e", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("]e", vim.diagnostic.goto_next, "Next Diagnostic")
			end,
		})

		-- Configure ts_ls
		vim.lsp.config("ts_ls", {
			root_markers = { "package.json" },
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

		-- Configure biome
		vim.lsp.config("biome", {
			root_markers = { "biome.json", "biome.jsonc" },
			single_file_support = false,
		})

		-- Biome auto-format on save
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("BiomeFormatting", {}),
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.name == "biome" and client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("BiomeFormatting", {}),
						buffer = event.buf,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		require("mason-lspconfig").setup(opts)
	end,
}
