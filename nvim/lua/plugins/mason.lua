return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "html-lsp",
      "prettier",
      "pyright",
      "isort",
      "gopls",
      "goimports",
      "gofumpt",
      "sqlfluff",
    },
  },
}
