return {
  "iamcco/markdown-preview.nvim",
  lazy = false,
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  -- build = "cp app & npm install ",
  init = function()
    vim.g.mkdp_theme = "dark"
    vim.g.mkdp_port = "8380"
    vim.g.mkdp_open_ip = "127.0.0.1" -- 在虚拟机中或代理中打开vim时，需要设置开放主机ip。
  end,
  keys = {
    {
      "<leader>lM",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.cmd([[do FileType]])
  end,
}
