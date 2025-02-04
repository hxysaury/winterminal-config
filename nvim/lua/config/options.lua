-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.autoformat = false
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.g.neovide_floating_shadow = false
vim.g.neovide_input_ime = true
vim.g.neovide_cursor_vfx_particle_density = 100.0
-- 输入的时候隐藏鼠标
vim.g.neovide_hide_mouse_when_typing = true

local opt = vim.opt
opt.title = true
-- 自动切换工作目录
opt.autochdir = true
-- opt.spell = false
-- 共享系统剪切
opt.clipboard = "unnamedplus"
-- 命令模式显示补全菜单
opt.wildmenu = true
-- /搜索时忽略大小写
opt.ignorecase = true
-- /搜索时智能大小写
opt.smartcase = true
opt.conceallevel = 0
opt.wrap = true
opt.relativenumber = false
-- opt.guifont = { "CaskaydiaCove Nerd Font", "Source Han Sans SC", ":h17" }
if vim.fn.has("mac") == 1 then
  opt.guifont = { "CaskaydiaCove Nerd Font", "PingFang SC", ":h12" }
else
  opt.guifont = { "CaskaydiaCove Nerd Font", ":h12" }
end
opt.guicursor =
  "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait0-blinkoff0-blinkon0-Cursor/lCursor,sm:block-blinkwait0-blinkoff0-blinkon0"
opt.list = true
opt.listchars = { space = "·" }
opt.shell = "pwsh"
opt.shellcmdflag = "-command"
opt.shellquote = '"'
opt.shellxquote = ""
opt.modelines = 0
opt.showcmd = false
-- 在光标上方和下方保留的最小屏幕行数
opt.scrolloff = 4
opt.cinkeys = "0{,0},0),0],0#,!^F,o,O,e"
opt.indentkeys = "0{,0},0),0],0#,!^F,o,O,e"
-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.g.lazyvim_python_lsp = "pyright"

-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"

vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
