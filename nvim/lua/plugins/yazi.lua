return {
  "mikavilpas/yazi.nvim", -- 使用yazi替代joshuto和ranger,仍然使用fm-nvim来启动lazygit
  event = "VeryLazy",
  keys = {
    { "tt", "<cmd>Yazi<CR>", desc = "Toggle Yazi" },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
  config = function() end,
}
