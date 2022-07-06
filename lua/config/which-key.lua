require("which-key").setup({
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 2, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = {
    "<silent>",
    "<cmd>",
    "<Cmd>",
    "<cr>",
    "<CR>",
    "call",
    "lua",
    "require",
    "^:",
    "^ ",
  }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
})

local wk = require("which-key")
local default_options = { silent = true }

-- register non leader based mappings
wk.register({
  ['<C-h>'] = { "<cmd>BufferLineCyclePrev<CR>", "Previous Tab/Buffer"},
  ['<C-l>'] = { "<cmd>BufferLineCycleNext<CR>", "Next Tab/Buffer"},
  ['<C-S-h>'] = { "<cmd>BufferLineMovePrev<CR>", "Move Back Tab/Buffer"},
  ['<C-S-l>'] = { "<cmd>BufferLineMoveNext<CR>", "Move Forth Tab/Buffer"},
  ['<C-n>'] = "Number toggle",
  ['<C-w>'] = { "<cmd>lua require('bufdelete').bufdelete(0, true)<CR>", "Close Tab/Buffer"},
  f = {
    f = { "<cmd>lua require('telescope.builtin').find_files()<CR>", "Find files" },
    b = { "<cmd>lua require('telescope.builtin').buffers()<CR>", "Find buffers" },
    g = { "<cmd>lua require('telescope.builtin').live_grep()<CR>", "Grep in files" },
    s = { "<cmd>lua require('telescope.builtin').grep_string()<CR>", "List Color schemes" },
    p = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Open project" },
    h = { "<cmd>Telescope heading<cr>", "Telescope Headings" },
    k = { "<cmd>Telescope keymaps<cr>", "Telescope Keymaps" },
    c = { "<cmd>Telescope commands<cr>", "Telescope Commands" },
    P = { "<cmd>Telescope builtin<cr>", "Telescope Builtin" },
  },
  g = {
    name = "Coding Mappings",
    D = { "<cmd>lua require('lsp-format-fns').lsp_definitions_custom()<CR>", "LSP Definitions" },
    i = { "<cmd>lua require('lsp-format-fns').lsp_implementations_custom()<CR>", "LSP Implementations" },
    r = { "<cmd>lua require('lsp-format-fns').lsp_references_custom()<CR>", "LSP References" },
    R = { "<cmd>Trouble lsp_references<cr>", "LSP References (Trouble)" },
    ds = { "<cmd>lua require('lsp-format-fns').lsp_document_symbols_custom()<CR>", "LSP Doc Symbols" },
    ws = { "<cmd>lua require('lsp-format-fns').lsp_dynamic_workspace_symbols_custom()<CR>", "LSP WS Symbols" },

  },
  K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "LSP Hover" },
  s = {
    a = "Add surrounding",
    d = "Delete surrounding",
    r = "Replace surrounding",
  },
  ['[c'] = { "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>","Previous Diagnostic" },
  [']c'] = { "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>","Next Diagnostic" }
}, { noremap = true })

-- Register all leader based mappings
wk.register({
  ["<tab>"] = { "Semantic visual selection" },
  a = {
    name = "Telescope Diagnostics",
    x = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "All workspace diagnostics" },
    w = { "<cmd>lua require('telescope.builtin').diagnostics({severity = 'E'})<CR>", "All workspace errors" },
    d = { "<cmd>lua require('telescope.builtin').diagnostics({bufnr = 0})<CR>", "Current buffer diagnostics" }
  },
  c = {
    name = "LSP Actions",
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format current buffer" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Run Code Action current buffer" },
    l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Run Code lens"},
    t = {
      name = "LSP Tree view",
      v = { "<cmd>lua require('metals.tvp').toggle_tree_view()<CR>", "Toggle LSP Tree view" },
      c = { "<cmd>lua require('metals.tvp').reveal_in_tree()<CR>", "Reveal file in LSP Tree view" }
    }
  },
  d = {
    name = "LSP Debug (DAP)",
    c = {"<cmd>lua require'dap'.continue()<CR>", "Continue (DEBUG)"},
    r = {"<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle REPL (DEBUG)"},
    K = {"<cmd>lua require'dap.ui.widgets'.hover()<CR>", "Hover (DEBUG)"},
    t = {"<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint at cursor (DEBUG)"},
    l = {"<cmd>lua require'dap'.run_last()<CR>", "Run Last (DEBUG)"},
    s = {
      o = {"<cmd>lua require'dap'.step_over()<CR>", "Step over (DEBUG)"},
      i = {"<cmd>lua require'dap'.step_into()<CR>", "Step into (DEBUG)"}
    }
  },
  f = {
    name = "Files",
    f = { "<cmd>Telescope file_browser<cr>", "File browser" },
    t = { "<cmd>TodoTelescope<cr>", "TODOs browser" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    s = { "<cmd>lua require('telescope.builtin').colorscheme()<CR>", "Pick Color scheme"},
    T = { "<cmd>NvimTreeFindFile<CR>", "Find in Tree" },
  },
  l = {
    c = {"<cmd>lua require('telescope').extensions.metals.commands()<CR>", "Show Metals Commands"}
  },
  p = { "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", "Yank history" },
  t = { "<cmd>NvimTreeToggle<CR>", "Folder Tree toggle"},
  T = { "<cmd>NvimTreeFindFile<CR>", "Find file in Tree"},
  w = {
    s = {  '<cmd>lua require"metals".hover_worksheet()<CR>', "LSP Metals worksheet hover" }
  },
  x = {
    name = "Trouble",
    x = { "<cmd>Trouble<cr>", "Trouble Diagnostics" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Trouble WS Diagnostics" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Trouble Doc Diagnostics" },
    l = { "<cmd>Trouble loclist<cr>", "Trouble LocList" },
    q = { "<cmd>Trouble quickfix<cr>", "Trouble QuickFix" },
    t = { "<cmd>TodoTrouble<cr>", "Trouble TODO" },
  }
}, { prefix = "<leader>", mode = "n", default_options })
