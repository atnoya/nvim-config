local api = vim.api
local settings = require("user-conf")

-- Set to no relative number when on insert
api.nvim_create_autocmd({"InsertEnter"}, {
  pattern = {"*"},
  callback = function() 
    vim.o.relativenumber = false
  end 
})

-- Return to relative number when back from inser
api.nvim_create_autocmd({"InsertLeave"}, {
  pattern = {"*"},
  callback = function() 
    vim.o.relativenumber = true
  end 
})

-- Enable spell checking for certain file types
api.nvim_create_autocmd(
	{ "BufRead", "BufNewFile" },
	{ pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" }
)

-- Some file types user real tabs
api.nvim_create_autocmd(
  { "FileType" },
  { pattern = { "make", "gitconfig" }, command = "set noexpandtab sw=4"}
)


-- Make sure all markdown files have the correct filetype
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.md", "*.markdown" }, command = "setf markdown"}
)
  
api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.dockerfile", "*.Dockerfile", "Dockerfile" }, command = "setf Dockerfile"}
)

-- Autosync on plugins.lua save
if settings.packer_auto_sync then
	-- source plugins.lua and run PackerSync on save
	local sync_packer = function()
		vim.cmd("runtime lua/plugins.lua")
		require("packer").sync()
	end
	api.nvim_create_autocmd({ "BufWritePost" }, {
		pattern = { "nvim/**", "" },
		callback = sync_packer,
	})
end
