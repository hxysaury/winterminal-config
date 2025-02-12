return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {

    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>c", desc = "Close current Buffer" },
        {
          "<leader>w",
          desc = "Save current file",
        },
      },
      { "<leader>wm", hidden = true },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    wk.add({
      { "<leader>p", group = "TagBar" },
      { "<leader>pp", "<cmd>TagbarToggle<cr>", desc = "Toggle TagBar" },
      { "<leader>ps", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" },
    })

    wk.add({
      { "<leader>z", group = "Focus/ZenMode" },
      { "<leader>zl", "<cmd>Twilight<cr>", desc = "Toggle Twilight" },
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    })
    wk.add({
      { "<leader>t", group = "ToggleTerm" },
    })
    wk.add({
      { "<leader>a", group = "ai" },
    })
    wk.add({
      { "<leader>wm", desc = "toggle window maximize" },
    })
    wk.add({
      { "<leader>r", group = "Run Code" },
    })
    wk.add({
      { "<leader><leader>", group = "Jump" },
    })
    wk.add({
      { "<leader>f", group = "find" },
    })

    wk.add({
      { "<leader>l", group = "Others" },
      { "<leader>lh", desc = "yazi help?" },
      { "<leader>lp", desc = "PastImage" },
    })
    wk.add({
      { "<leader>D", group = "DataBase" },
      { "<leader>DD", desc = "DBUI" },
      { "<leader>DT", desc = "DBUIToggle" },
      { "<leader>DA", desc = "DBUIAddConnection" },
      { "<leader>DF", desc = "DBUIFindBuffer" },
    })
  end,
}
