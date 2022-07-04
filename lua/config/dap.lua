local dap = require("dap")
dap.defaults.fallback.terminal_win_cmd = '50hsplit new'
dap.defaults.fallback.focus_terminal = true

vim.fn.sign_define('DapBreakpoint', {text='🚩', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🏳', texthl='', linehl='', numhl=''})

