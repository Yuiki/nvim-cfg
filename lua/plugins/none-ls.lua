return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local eslint_config_files = {
      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.json",
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
      "eslint.config.ts",
    }

    local prettier_config_files = {
      ".prettierrc",
      ".prettierrc.js",
      ".prettierrc.cjs",
      ".prettierrc.json",
      "prettier.config.js",
      "prettier.config.cjs",
      "prettier.config.mjs",
    }

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file(prettier_config_files)
          end,
        }),
        require("none-ls.formatting.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        require("none-ls.diagnostics.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        require("none-ls.code_actions.eslint_d").with({
          condition = function(utils)
            return utils.root_has_file(eslint_config_files)
          end,
        }),
        null_ls.builtins.formatting.stylua,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
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
