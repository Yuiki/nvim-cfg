return {
  "mason-org/mason-lspconfig.nvim",
  event = "BufReadPre",
  opts = {
    ensure_installed = { "ts_ls", "lua_ls", "biome", "terraformls", "kotlin_lsp", "cssls" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  keys = {
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "LSP Restart" },
    { "<leader>li", "<cmd>LspInfo<cr>",    desc = "LSP Info" },
    { "<leader>ll", "<cmd>LspLog<cr>",     desc = "LSP Log" },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup(opts)

    vim.lsp.config("ts_ls", {
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
  end,
}
