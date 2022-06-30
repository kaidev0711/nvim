local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}


local Terminal = require('toggleterm.terminal').Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end

local mappings = {
  q = { ":q<cr>", "Quit" },
  Q = { ":wq<cr>", "Save & Quit" },
  w = { ":w<cr>", "Save" },
  x = { ":bdelete<cr>", "Close" },
  E = { ":e ~/.config/nvim/init.lua<cr>", "Edit config" },
  f = { ":Telescope find_files<cr>", "Telescope Find Files" },
  r = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
  t = {
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    l = { toggle_lazygit, "LazyGit" }
  },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "Connected Language Servers" },
    k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
    K = { "<cmd>Lspsaga hover_doc<cr>", "Hover Commands" },
    w = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder" },
    W = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" },
    R = { '<cmd>Lspsaga rename<cr>', "Rename" },
    a = { '<cmd>Lspsaga code_action<cr>', "Code Action" },
    e = { '<cmd>Lspsaga show_line_diagnostics<cr>', "Show Line Diagnostics" },
    n = { '<cmd>Lspsaga diagnostic_jump_next<cr>', "Go To Next Diagnostic" },
    N = { '<cmd>Lspsaga diagnostic_jump_prev<cr>', "Go To Previous Diagnostic" },
    f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', "formatting"}
  },
  z = {
    name = "Focus",
    z = { ":ZenMode<cr>", "Toggle Zen Mode" },
    t = { ":Twilight<cr>", "Toggle Twilight" }
  },
  p = {
    name = "Packer",
    r = { ":PackerClean<cr>", "Remove Unused Plugins" },
    c = { ":PackerCompile profile=true<cr>", "Recompile Plugins" },
    i = { ":PackerInstall<cr>", "Install Plugins" },
    p = { ":PackerProfile<cr>", "Packer Profile" },
    s = { ":PackerSync<cr>", "Sync Plugins" },
    S = { ":PackerStatus<cr>", "Packer Status" },
    u = { ":PackerUpdate<cr>", "Update Plugins" }
  },
  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },  
  },
  d = {
      name = "Debug",
      R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      f = { "<cmd>lua require('dapui').float_element(<element ID>, <optional settings>)<cr>", "dapui float_element"},
      g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      p = { "<cmd>lua require'dap'.pause.toggle()<CR>", "Pause" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
      s = { "<cmd>lua require'dap'.continue()<CR>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    },
  m = {
    name = "Telescope dap",
    c = {'<cmd>lua require"telescope".extensions.dap.commands{}<CR>', "dap commands"},
    p = {'<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', "dap configrations"},
    b = {'<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', "dap list Breakpoint"},
    v = {'<cmd>lua require"telescope".extensions.dap.variables{}<CR>', "dap Variables"},
    f = {'<cmd>lua require"telescope".extensions.dap.frames{}<CR>', "dap frames"},
    },
  t = {
      t = {"<cmd>TroubleToggle<cr>", "Trouble Toggle"},
      w = {"<cmd>Trouble workspace_diagnostics<cr>", "Trouble workspace_diagnostics"},
      d = {"<cmd>Trouble document_diagnostics<cr>", "Trouble document_diagnostics"},
      l = {"<cmd>Trouble loclist<cr>", "Trouble loclist"},
      q = {"<cmd>Trouble quickfix<cr>", "Trouble quickfix"},
      r = {"<cmd>Trouble lsp_references<cr>", "Trouble lsp_references"},
  }
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)
