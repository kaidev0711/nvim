-- Selene: allow(global_usage)
_G.dump = function(...)
  print(vim.inspect(...))
end

-- Selene: allow(global_usage)
_G.profile = function(cmd, times)
  times = times or 100
  local args = {}
  if type(cmd) == "string" then
    args = { cmd }
    cmd = vim.cmd
  end
  local start = vim.loop.hrtime()
  for _ = 1, times, 1 do
    local ok = pcall(cmd, unpack(args))
    if not ok then
      error("Command failed: " .. tostring(ok) .. " " .. vim.inspect({ cmd = cmd, args = args }))
    end
  end
  print(((vim.loop.hrtime() - start) / 1000000 / times) .. "ms")
end

local M = {}

M.functions = {}

function M.execute(id)
  local func = M.functions[id]
  if not func then
    error("Function doest not exist: " .. id)
  end
  return func()
end

local map = function(mode, key, cmd, opts, defaults)
  opts = vim.tbl_deep_extend("force", { silent = true }, defaults or {}, opts or {})

  if type(cmd) == "function" then
    table.insert(M.functions, cmd)
    if opts.expr then
      cmd = ([[luaeval('require("util").execute(%d)')]]):format(#M.functions)
    else
      cmd = ("<cmd>lua require('util').execute(%d)<cr>"):format(#M.functions)
    end
  end
  if opts.buffer ~= nil then
    local buffer = opts.buffer
    opts.buffer = nil
    return vim.api.nvim_buf_set_keymap(buffer, mode, key, cmd, opts)
  else
    return vim.api.nvim_set_keymap(mode, key, cmd, opts)
  end
end

function M.map(mode, key, cmd, opt, defaults)
  return map(mode, key, cmd, opt, defaults)
end

function M.nmap(key, cmd, opts)
  return map("n", key, cmd, opts)
end
function M.vmap(key, cmd, opts)
  return map("v", key, cmd, opts)
end
function M.xmap(key, cmd, opts)
  return map("x", key, cmd, opts)
end
function M.imap(key, cmd, opts)
  return map("i", key, cmd, opts)
end
function M.omap(key, cmd, opts)
  return map("o", key, cmd, opts)
end
function M.smap(key, cmd, opts)
  return map("s", key, cmd, opts)
end

function M.nnoremap(key, cmd, opts)
  return map("n", key, cmd, opts, { noremap = true })
end
function M.vnoremap(key, cmd, opts)
  return map("v", key, cmd, opts, { noremap = true })
end
function M.xnoremap(key, cmd, opts)
  return map("x", key, cmd, opts, { noremap = true })
end
function M.inoremap(key, cmd, opts)
  return map("i", key, cmd, opts, { noremap = true })
end
function M.onoremap(key, cmd, opts)
  return map("o", key, cmd, opts, { noremap = true })
end
function M.snoremap(key, cmd, opts)
  return map("s", key, cmd, opts, { noremap = true })
end

return M
