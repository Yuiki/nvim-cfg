return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "ts_ls", "lua_ls" }
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig").tl_ls.setup {
        capabilities = capabilities,
      }
      require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
      }
    end
}

