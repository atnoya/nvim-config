require("bufferline").setup{
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " "
          or (e == "warning" and " " or "" )
        s = s .. n .. " " .. sym
      end
      return s
    end,
    custom_filter = function(buf_number, buf_numbers)
      if vim.fn.bufname(buf_number) ~= "[dap-repl]" then
        return true
      end
    end,
    show_tab_indicators = true,
    offsets = {
			{
				filetype = "NvimTree",
				text = " File Explorer",
				highlight = "Directory",
				text_align = "left",
				padding = 1,
			},
		},
  },
  highlights = {
    tab_selected = {
      bold = true
    },
    buffer_selected = {
      bold = true
    },
    diagnostic_selected = {
      bold = true
    },
    info_selected = {
      bold = true
    },
    info_diagnostic_selected = {
      bold = true
    },
    warning_selected = {
      bold = true
    },
    warning_diagnostic_selected = {
      bold = true
    },
    error_selected = {
      bold = true
    },
    error_diagnostic_selected = {
      bold = true
    },
    pick_selected = {
      bold = true
    },
    pick = {
      bold = true
    }
  }
}

