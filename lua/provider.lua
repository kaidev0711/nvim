--python
if vim.fn.executable("pyenv") == 1 then
  -- Set the path to the default Python executable managed by Pyenv
  vim.g.python3_host_prog = os.getenv("HOME") .. "/.pyenv/versions/3.11.4/bin/python3"

  -- Check if a virtual environment is active
  local virtualenv = vim.env.VIRTUAL_ENV
  if virtualenv ~= nil then
    -- Set the path to the Python executable within the virtual environment
    local python_path = virtualenv .. "/bin/python"
    vim.g.python3_host_prog = python_path
  end
  -- else
  -- Set the path to the default Python executable on your system
  -- vim.g.python3_host_prog = 'python3'
end
