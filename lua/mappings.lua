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
map("v", ".", ":normal .<CR>")

--
-- sidebar
--
-- map("n", "<leader>1", "<cmd>lua require('sidebar-nvim').focus({ section_index = 1})<CR>", { silent = true })
-- map("n", "<leader>2", "<cmd>lua require('sidebar-nvim').focus({ section_index = 2})<CR>", { silent = true })
-- map("n", "<leader>3", "<cmd>lua require('sidebar-nvim').focus({ section_index = 3})<CR>", { silent = true })
-- map("n", "<leader>4", "<cmd>lua require('sidebar-nvim').focus({ section_index = 4})<CR>", { silent = true })
-- map("n", "<leader>5", "<cmd>lua require('sidebar-nvim').focus({ section_index = 5})<CR>", { silent = true })
-- map("n", "<leader>6", "<cmd>lua require('sidebar-nvim').focus({ section_index = 5})<CR>", { silent = true })
