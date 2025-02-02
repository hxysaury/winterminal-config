return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      -- autopep8 似乎要比 black 要快一些
      ["python"] = { "black", "isort" },
      ["css"] = { "prettier" },
      ["html"] = { "html-lsp" },
      ["go"] = { "goimports", "gofumpt" },
      ["lua"] = { "stylua" },
      ["fish"] = { "fish_indent" },
      ["sh"] = { "shfmt" },
      --php = { "pint" },
      ["php"] = { "php-cs-fixer" },
      ["blade"] = { "blade-formatter", "rustywind" },
      ["javascript"] = { "prettier" },
      ["rust"] = { "rustfmt" },
      ["json"] = { "prettierd" },
    },
  },
}
