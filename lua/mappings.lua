vim.g.mapleader=" "
vim.g.maplocalleader="\\"

local map = vim.keymap.set
-- Stop the annoying window popping up whne pressing q:
map("n", "q:", ":q")
-- Allows for insterting a new line without entering insert mode using CR for new line and Shift + CR for a new line above
map("n", "<S-CR>", "O<Esc>j")
map("n", "<CR>", "o<Esc>")

local numberToggle = function()
  if vim.o.relativenumber then
    vim.o.relativenumber = false
  else 
    vim.o.relativenumber = true
  end
end
-- Switch line number indicator
map("n", "<C-n>", function() numberToggle() end)

-- CODING

-- LSP mappings
map("n", "gD", "<cmd>lua require('telescope.builtin').lsp_definitions({query='vim.lsp.buf.definition()'})<CR>")
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

-- Implementations
map("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations({query='vim.lsp.buf.implementation()'})<CR>")

-- References
map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references({query='vim.lsp.buf.references()'})<CR>")
map("n", "gR", "<cmd>Trouble lsp_references<cr>")

-- Symbols
map("n", "gds", "<cmd>lua require('telescope.builtin').lsp_document_symbols({query = 'vim.lsp.buf.document_symbol()'})<CR>")
map("n", "gws", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols({query= 'vim.lsp.buf.workspace_symbol()'})<CR>")

-- Diagnostics
map("n", "<leader>xx", "<cmd>Trouble<cr>")
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>")

map("n", "<Leader>aa", [[<cmd>lua require('telescope.builtin').diagnostics()<CR>]]) -- all workspace diagnostics
map("n", "<Leader>ae", [[<cmd>lua require('telescope.builtin').diagnostics({severity = "E"})<CR>]]) -- all workspace errors
map("n", "<Leader>aw", [[<cmd>lua require('telescope.builtin').diagnostics({severity = "W"})<CR>]]) -- all workspace warnings
map("n", "<Leader>ad", "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>") -- buffer diagnostics only
map("n", "[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
map("n", "]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")

-- Other LSP
map("n", "<Leader>lc", "<cmd>lua require('telescope').extensions.metals.commands()<CR>")
map("n", "<Leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]])
map("n", "<Leader>cs", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]])
map("n", "<Leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
map("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<Leader>ctv", "<cmd>lua require('metals.tvp').toggle_tree_view()<CR>")
map("n", "<Leader>ctc", "<cmd>lua require('metals.tvp').reveal_in_tree()<CR>")

-- Scala WS
map("n", "<Leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>')

-- Debugging
map("n", "<Leader>dc", [[<cmd>lua require"dap".continue()<CR>]])
map("n", "<Leader>dr", [[<cmd>lua require"dap".repl.toggle()<CR>]])
map("n", "<Leader>dK", [[<cmd>lua require"dap.ui.widgets".hover()<CR>]])
map("n", "<Leader>dt", [[<cmd>lua require"dap".toggle_breakpoint()<CR>]])
map("n", "<Leader>dso", [[<cmd>lua require"dap".step_over()<CR>]])
map("n", "<Leader>dsi", [[<cmd>lua require"dap".step_into()<CR>]])
map("n", "<Leader>dl", [[<cmd>lua require"dap".run_last()<CR>]])

--
-- Telescope
--
map("n", "ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "fs", "<cmd>lua require('telescope.builtin').grep_string()<CR>")
map("n", "fcs", "<cmd>lua require('telescope.builtin').colorscheme()<CR>")
map("n", "fp", "<cmd>lua require('telescope').extensions.projects.projects()<CR>")
map("n", "fh", "<cmd>Telescope heading<cr>")
map("n", "fk", "<cmd>Telescope keymaps<cr>")
map("n", "fc", "<cmd>Telescope commands<cr>")
map("n", "fP", "<cmd>Telescope builtin<cr>")
map("n", "<leader>ff", "<cmd>Telescope file_browser<CR>", { noremap = true })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")


--
-- Trouble
--
map("n", "<leader>xl", "<cmd>Trouble loclist<cr>")
map("n", "<leader>xq", "<cmd>Trouble quickfix<cr>")
map("n", "<leader>xt", "<cmd>TodoTrouble<cr>")

--
-- Tabs and buffers
--
map("n", "<C-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
map("n", "<C-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true })
map("n", "<C-S-h>", "<cmd>BufferLineMovePrev<CR>", { silent = true })
map("n", "<C-S-l>", "<cmd>BufferLineMoveNext<CR>", { silent = true })
map("n", "<C-w>", "<cmd>bdelete<CR>")

--
-- NVimTree
--
map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>T", "<cmd>NvimTreeFindFile<CR>")
--
-- WhichKey
--
-- map("n", "<leader>", "<cmd>WhichKey '<Space>'<CR>", { silent = true })
-- map("n", "g", "<cmd>WhichKey 'g'<CR>", { silent = true })

--
-- Neoclip
--
map("n", "<leader>p", "<cmd>lua require('telescope').extensions.neoclip.default()<CR>")

--
-- sidebar
--
-- map("n", "<leader>1", "<cmd>lua require('sidebar-nvim').focus({ section_index = 1})<CR>", { silent = true })
-- map("n", "<leader>2", "<cmd>lua require('sidebar-nvim').focus({ section_index = 2})<CR>", { silent = true })
-- map("n", "<leader>3", "<cmd>lua require('sidebar-nvim').focus({ section_index = 3})<CR>", { silent = true })
-- map("n", "<leader>4", "<cmd>lua require('sidebar-nvim').focus({ section_index = 4})<CR>", { silent = true })
-- map("n", "<leader>5", "<cmd>lua require('sidebar-nvim').focus({ section_index = 5})<CR>", { silent = true })
-- map("n", "<leader>6", "<cmd>lua require('sidebar-nvim').focus({ section_index = 5})<CR>", { silent = true })
