local map = vim.keymap.set
-- TODO: 不知道为什么 <leader>w 和 <leader>c 无法在 which-key 中显示
-- 添加 <leader>w 来保存当前buffer 的映射
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- 单独设置 neovide 的主题

if vim.g.neovide then
  vim.cmd.colorscheme("catppuccin")
  vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
end

-- 设置 visual 模式下选中的背景高亮色
vim.cmd("highlight Visual guibg=#135564")

-- 设置光标的颜色默认为拉姆的发(fà)色
vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")

-- hop
-- 设置单字符高亮的颜色为 notion 中的暗色模式下的砖红色
vim.api.nvim_command("highlight HopNextKey guifg=#FF7369 guibg=none gui=none ctermfg=none cterm=bold")

-- 解决 python 在定义函数参数时按下 : 会自动缩进的问题
vim.api.nvim_command("set indentkeys-=<:>")
-- copy relative path
vim.cmd([[
command! -nargs=0 CpRelativePath lua require("utils.copy").copy_relative_path()
]])

-- copy relative path
vim.cmd([[
command! -nargs=0 CpFileName lua require("utils.copy").copy_current_filename()
]])

-- copy absolute path
vim.cmd([[
command! -nargs=0 CpAbsolutePath lua require("utils.copy").copy_absolute_path()
]])
local telescope = require("telescope")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").cycle_history_next,
        ["<C-k>"] = require("telescope.actions").cycle_history_prev,
      },
    },
  },
})
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc><esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- require("lazy").setup({
--   {
--     "L3MON4D3/LuaSnip",
--     config = function()
--       require("snippets")
--     end,
--   },
-- })
