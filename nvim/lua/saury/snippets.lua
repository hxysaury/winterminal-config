-- 检测当前系统是否为 Windows
local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

-- 定义路径
local snippets_path
if is_windows then
  -- Windows 系统路径
  snippets_path = "C:\\Users\\Z\\AppData\\Local\\nvim\\lua\\snippets"
else
  -- Linux 系统路径
  snippets_path = "~/.config/nvim/lua/snippets"
end

-- 加载 LuaSnip 模板
require("luasnip.loaders.from_lua").load({
  paths = { snippets_path },
})
