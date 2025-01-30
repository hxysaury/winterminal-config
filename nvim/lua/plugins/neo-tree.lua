return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true, dir = LazyVim.root() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, reveal = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", toggle = true })
      end,
      desc = "Git Explorer",
    },
    {
      "<leader>be",
      function()
        require("neo-tree.command").execute({ source = "buffers", toggle = true })
      end,
      desc = "Buffer Explorer",
    },
  },
  -- config = function()
  --   require("neo-tree").setup({
  --     window = {
  --       position = "left",
  --       width = 30,
  --     },
  --     filesystem = {
  --       follow_current_file = true, -- 确保切换到当前文件所在目录
  --     },
  --     event_handlers = {
  --       {
  --         event = "neo_tree_buffer_enter",
  --         handler = function(args)
  --           -- 切换工作目录到当前文件所在目录
  --           local current_file = vim.api.nvim_buf_get_name(args.bufnr)
  --           local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  --           vim.cmd("cd " .. current_dir)
  --         end,
  --       },
  --     },
  --   })
  -- end,
}
