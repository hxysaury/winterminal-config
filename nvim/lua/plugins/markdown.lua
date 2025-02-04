local map = vim.keymap.set
-- 获取当前文件名
local filename = vim.fn.expand("%:t")
-- 删除扩展,并添加连加符号`.`
filename = string.gsub(filename, "%..*", "") .. "."
-- 使用空格+lp来粘贴间剪切板的图片,然后输入想保存的图片名称，
-- 图片会自动保存在当前文件的同一目录下并调整为markdown格式
-- map("n", "<space>lp", "PasteImage")

map("n", "<space>lp", ":PasteImage<CR>")
return {
  {
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
      -- vim.g.mkdp_open_ip = "0.0.0.0" -- 在虚拟机中或代理中打开vim时，需要设置开放主机ip。
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
  },
  --windows不支持，这里注释掉
  -- {
  --   "3rd/image.nvim",
  --   dependencies = {
  --     "vhyrro/luarocks.nvim",
  --     priority = 1001, -- this plugin needs to run before anything else
  --     opts = {
  --       rocks = { "magick" },
  --     },
  --   },
  --   config = function()
  --     -- default config
  --     require("image").setup({
  --       -- backend = "kitty",
  --       backend = "ueberzug",
  --       integrations = {
  --         markdown = {
  --           enabled = true,
  --           clear_in_insert_mode = false, -- 插入模式的时候隐藏
  --           download_remote_images = true,
  --           only_render_image_at_cursor = false,
  --           filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
  --         },
  --         neorg = {
  --           enabled = true,
  --           clear_in_insert_mode = true,
  --           download_remote_images = true,
  --           only_render_image_at_cursor = false,
  --           filetypes = { "norg" },
  --         },
  --       },
  --       max_width = nil,
  --       max_height = nil,
  --       max_width_window_percentage = nil,
  --       max_height_window_percentage = 50,
  --       window_overlap_clear_enabled = true, -- 当打开重叠的浮动窗口时隐藏图片
  --       window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --       editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus
  --       tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  --       hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  --     })
  --   end,
  -- },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    config = function()
      require("img-clip").setup({
        default = {
          dir_path = filename .. "assets", -- 图片保存路径：./文件名.assets
          insert_mode_after_paste = false, -- 粘贴图片后不进入插入模式
        },
        filetypes = {
          markdown = {
            url_encode_path = true, ---@type boolean
            template = "![$FILE_NAME_NO_EXT]($FILE_PATH)", -- 图片模板，中括号提示包含文件名
            download_images = false, ---@type boolean
          },
        },
      })
    end,
  },
}
