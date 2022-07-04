local ts = require("nvim-treesitter")

local metals_status = function() 
  return vim.g['metals_status']
end

require("lualine").setup({
  options = { 
    theme = "auto",
    disabled_filetypes = {},
  },
  sections = {
    lualine_c = {
      { metals_status, cond = function() return vim.g['metals_status'] ~= nil end }
    },
    lualine_x = {
      { "filetype", icon_only = true },
			"fileformat",
			"filesize",
		},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
})
