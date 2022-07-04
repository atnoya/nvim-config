require('nvim-treesitter.configs').setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<leader><TAB>",
      scope_incremental = "<leader><TAB>",
      node_incremental = "<TAB>",
      node_decremental = "<S-TAB>",
    },
  },
  highlight = {
    enable = true,
  },
  indent = { enable = true },
	autopairs = { enable = true },
  endwise = { enable = true},
  textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ib"] = "@block.inner",
				["ab"] = "@block.outer",
				["ir"] = "@parameter.inner",
				["ar"] = "@parameter.outer",
			},
		},
	},
  ensure_installed = { 'lua', 'scala', 'json', 'rust', 'ruby', 'python', 'javascript', 'markdown', 'rst', 'make', 'java', 'yaml', 'html', 'go' }
}
