-- return {
--   {
--     "kristijanhusak/vim-dadbod-completion",
--     dependencies = "tpope/vim-dadbod",
--     ft = "sql",
--     init = function()
--       vim.api.nvim_create_autocmd("FileType", {
--         pattern = "sql",
--         callback = function()
--           if LazyVim.cmp_engine() == "nvim-cmp" then
--             local cmp = require("cmp")
--             local sources = vim.tbl_map(function(source)
--               return { name = source.name }
--             end, cmp.get_config().sources)
--             table.insert(sources, { name = "vim-dadbod-completion" })
--             cmp.setup.buffer({ sources = sources })
--           end
--         end,
--       })
--     end,
--   },
--   {
--     "kristijanhusak/vim-dadbod-ui",
--     cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
--     dependencies = "vim-dadbod",
--     keys = {
--       { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
--     },
--     init = function()
--       local data_path = vim.fn.stdpath("data")
--       vim.g.db_ui_auto_execute_table_helpers = 1
--       vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
--       vim.g.db_ui_show_database_icon = true
--       vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
--       vim.g.db_ui_use_nerd_fonts = true
--       vim.g.db_ui_use_nvim_notify = true
--     end,
--   },
-- }
return {
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = "tpope/vim-dadbod",
    ft = "sql",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "sql",
        callback = function()
          -- 确保 blink.cmp 已加载
          if package.loaded["blink.cmp"] then
            local cmp = require("cmp")
            local sources = vim.tbl_map(function(source)
              return { name = source.name }
            end, cmp.get_config().sources)
            -- 添加 vim-dadbod-completion 作为数据源
            table.insert(sources, { name = "vim-dadbod-completion" })
            cmp.setup.buffer({ sources = sources })
          end
        end,
      })
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
    dependencies = "tpope/vim-dadbod",
    keys = {
      { "<leader>D", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
    },
    init = function()
      local data_path = vim.fn.stdpath("data")
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_use_nvim_notify = true
    end,
  },
}
