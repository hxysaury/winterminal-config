-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- make telescope preview show line numbers

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end
----python实现自动插入 self
--local ts_utils = require("nvim-treesitter.ts_utils")
--
--vim.api.nvim_create_autocmd("InsertCharPre", {
--  pattern = "*.py",
--  callback = function()
--    local node = ts_utils.get_node_at_cursor()
--    if node and node:type() == "function_definition" then
--      local parent = ts_utils.get_node_parent(node)
--      if parent and parent:type() == "class_definition" then
--        vim.api.nvim_input("self, ")
--      end
--    end
--  end,
--})
-- 自动为新创建的 Go 文件添加 package 声明

vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.go",
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local package_name = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
    if package_name == "" then
      package_name = "main"
    end
    vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, { "package " .. package_name })
    -- vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  end,
})
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.number = true
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
      require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("associate_filetype"),
  pattern = { "python" },
  callback = function()
    vim.opt.shiftwidth = 4
    vim.opt.formatoptions:remove({ "o" }) -- 防止使用 o 切换到下一行的时候自动加上注释符号(在上一行是注释的情况下)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("associate_filetype"),
  pattern = { "c", "cpp" },
  callback = function()
    vim.opt.shiftwidth = 2
    vim.opt.formatoptions:remove({ "o" }) -- 防止使用 o 切换到下一行的时候自动加上注释符号(在上一行是注释的情况下)
  end,
})
-- 禁用自动格式化：
---- 全局禁用：:FormatDisable
---- 当前缓冲区禁用：:FormatDisable!

-- 启用自动格式化：
---- 全局启用：:FormatEnable
---https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
require("conform").setup({
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
})

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})
