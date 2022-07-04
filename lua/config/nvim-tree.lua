local tree_cb = require("nvim-tree.config").nvim_tree_callback

require("nvim-tree").setup({
  respect_buf_cwd = true,
  update_cwd = true,
  hijack_cursor = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
  diagnostics = {
		enable = true,
		show_on_dirs = false,
		icons = { hint = "", info = "", warning = "", error = "" },
	},
  filters = {
		-- this option hides files and folders starting with a dot `.`
		dotfiles = false,
	},
  git = { enable = true, ignore = true, timeout = 400 },
  renderer = {
    indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
    icons = {
      padding = " ", -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
			symlink_arrow = " >> ", --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
    },
    highlight_git = true, -- will enable file highlight for git attributes (can be used without the icons).
		highlight_opened_files = "3", -- 0 -> "none" 1 -> "icon" 2 -> "name" 3 -> "all"
		add_trailing = true, -- append a trailing slash to folder names
		group_empty = true, --  compact folders that only contain a single folder into one node in the file tree
  },
  view = {
		-- show line numbers in tree disabled
		number = false,
		relativenumber = false,
		-- width of the window, can be either a number (columns) or a string in `%`
		width = 30,
		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = "left",
		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = true,
			-- list of mappings to set on the tree manually
			list = {
				{ key = { "<CR>", "o", "<2-LeftMouse>" }, cb = tree_cb("edit") },
				{ key = { "<2-RightMouse>", "<C-]>" }, cb = tree_cb("cd") },
				{ key = "<C-v>", cb = tree_cb("vsplit") },
				{ key = "<C-x>", cb = tree_cb("split") },
				{ key = "<C-t>", cb = tree_cb("tabnew") },
				{ key = "<", cb = tree_cb("prev_sibling") },
				{ key = ">", cb = tree_cb("next_sibling") },
				{ key = "P", cb = tree_cb("parent_node") },
				{ key = "<BS>", cb = tree_cb("close_node") },
				{ key = "<S-CR>", cb = tree_cb("close_node") },
				{ key = "<Tab>", cb = tree_cb("preview") },
				{ key = "K", cb = tree_cb("first_sibling") },
				{ key = "J", cb = tree_cb("last_sibling") },
				{ key = "I", cb = tree_cb("toggle_ignored") },
				{ key = "H", cb = tree_cb("toggle_dotfiles") },
				{ key = "R", cb = tree_cb("refresh") },
				{ key = "a", cb = tree_cb("create") },
				{ key = "d", cb = tree_cb("remove") },
				{ key = "r", cb = tree_cb("rename") },
				{ key = "<C-r>", cb = tree_cb("full_rename") },
				{ key = "x", cb = tree_cb("cut") },
				{ key = "c", cb = tree_cb("copy") },
				{ key = "p", cb = tree_cb("paste") },
				{ key = "y", cb = tree_cb("copy_name") },
				{ key = "Y", cb = tree_cb("copy_path") },
				{ key = "gy", cb = tree_cb("copy_absolute_path") },
				{ key = "[c", cb = tree_cb("prev_git_item") },
				{ key = "]c", cb = tree_cb("next_git_item") },
				{ key = "-", cb = tree_cb("dir_up") },
				{ key = "s", cb = tree_cb("system_open") },
				{ key = "q", cb = tree_cb("close") },
				{ key = "g?", cb = tree_cb("toggle_help") },
			},
		},
	},
})
