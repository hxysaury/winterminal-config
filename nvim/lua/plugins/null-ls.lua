return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = {
      -- JavaScript/TypeScript 格式化工具和诊断
      null_ls.builtins.formatting.eslint_d.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      }),
      null_ls.builtins.diagnostics.eslint.with({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
      }),
      -- Go 格式化工具
      null_ls.builtins.formatting.gofmt.with({
        filetypes = { "go" },
      }),
      null_ls.builtins.formatting.goimports.with({
        filetypes = { "go" },
      }),
      null_ls.builtins.formatting.rustfmt.with({
        filetypes = { "rs" },
      }),
    }
  end,
}
