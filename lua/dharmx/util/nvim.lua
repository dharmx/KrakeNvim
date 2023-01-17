local M = {}

local F = vim.fn
local A = vim.api
local cmd = A.nvim_command

function M.abbrev(buffer, command, expression)
  local formatted = string.format("cnoreabbrev %s %s %s", expression and "<expr>" or "", buffer, command)
  cmd(formatted)
end

function M.alias(alias, command, options)
  if type(options) == "string" then options = { desc = options } end
  options = vim.F.if_nil(options, {})
  A.nvim_create_user_command(alias, command, options)
end

function M.unalias(command) A.nvim_del_user_command(command) end

function M.balias(buffer, alias, command, options)
  options = options or {}
  A.nvim_buf_create_user_command(buffer, alias, command, options)
end

function M.autocmd(events, command, options)
  options = vim.F.if_nil(options, {})
  if type(options) == "string" then options = { desc = options } end
  local autocmd_options = {}
  autocmd_options[type(command) == "string" and "command" or "callback"] = command
  if not options.buffer then
    autocmd_options.pattern = options.patterns
  else
    autocmd_options.buffer = options.buffer or options.bufnr
  end
  if options.group then autocmd_options.group = options.group end
  return options.group, A.nvim_create_autocmd(events, autocmd_options)
end

function M.augroup(name, autocmds, clear)
  if type(autocmds) == "boolean" then return A.nvim_create_augroup(name, { clear = autocmds }) end
  local group = A.nvim_create_augroup(name, { clear = clear == false and false or true })
  for _, autocmd in ipairs(autocmds) do
    autocmd.options = vim.F.if_nil(autocmd.options, {})
    autocmd.options.group = group
    M.autocmd(autocmd.events, autocmd.command, autocmd.options)
  end
  return group
end

return M

-- vim:filetype=lua
