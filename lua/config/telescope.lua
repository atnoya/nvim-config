local utils = require("functions")
local telescope = require("telescope")
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local sorters = require("telescope.sorters")
local themes = require("telescope.themes")
local previewers = require("telescope.previewers")

local fb_actions = telescope.extensions.file_browser.actions

-- vim.g.theme_switcher_loaded = true

telescope.load_extension("projects")
telescope.load_extension("heading")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

telescope.setup({
	extensions = {
		["ui-select"] = { themes.get_dropdown({}) },
		file_browser = {
			mappings = {
				i = {
					["<c-n>"] = fb_actions.create,
					["<c-r>"] = fb_actions.rename,
					-- ["<c-h>"] = actions.which_key,
					["<c-h>"] = fb_actions.toggle_hidden,
					["<c-x>"] = fb_actions.remove,
					["<c-m>"] = fb_actions.move,
					["<c-y>"] = fb_actions.copy,
					["<c-a>"] = fb_actions.select_all,
				},
			},
		},
    heading = {
      treesitter = true,
    },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
		},
	},
	defaults = {
		file_ignore_patterns = { ".git", "node_modules", ".terraform", "%.jpg", "%.png" },
		-- used for grep_string and live_grep
		vimgrep_arguments = {
			"rg",
			"--follow",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--no-ignore",
			"--trim",
		},
		mappings = {
			i = {
				-- Close on first esc instead of going to normal mode
				-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist,
				["<C-l>"] = actions.send_to_qflist,
				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<cr>"] = actions.select_default,
				["<c-v>"] = actions.select_vertical,
				["<c-s>"] = actions.select_horizontal,
				["<c-t>"] = actions.select_tab,
				["<c-s-p>"] = action_layout.toggle_preview,
				["<c-o>"] = action_layout.toggle_mirror,
				["<c-h>"] = actions.which_key,
			},
		},
		prompt_prefix = "   ",
		selection_caret = " > ",
		entry_prefix = "   ",
		multi_icon = "<>",
		initial_mode = "insert",
		scroll_strategy = "cycle",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    -- file_sorter = sorters.get_fuzzy_file,
    -- generic_sorter = sorters.get_generic_fuzzy_sorter,
    -- file_previewer = previewers.vim_buffer_cat.new,
    -- grep_previewer = previewers.vim_buffer_vimgrep.new,
    -- qflist_previewer = previewers.vim_buffer_qflist.new,
		winblend = 0,
		border = true,
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	},
})

local light_black = "#3D3D3D"
local dark_black = "#222222"
local dark_white = "#BBBBBB"
local white = "#EEEEEE"

-- color
utils.bg("TelescopeNormal", dark_black)
utils.fg_bg("TelescopeTitle", dark_black, dark_black)
utils.fg_bg("TelescopeBorder", dark_black, dark_black)

utils.fg_bg("TelescopePromptBorder", light_black, light_black)
utils.fg_bg("TelescopePromptPrefix", white, light_black, "bold")
utils.fg_bg("TelescopePromptTitle", white, "#BB3333")
utils.fg_bg("TelescopePromptNormal", white, light_black)
utils.fg_bg("TelescopePromptCounter", white, light_black)

utils.fg_bg("TelescopePreviewBorder", dark_black, dark_black)
utils.fg_bg("TelescopePreviewTitle", white, "#338833")
utils.fg_bg("TelescopePreviewNormal", dark_white, dark_black)

utils.fg_bg("TelescopeResultsBorder", dark_black, dark_black)
utils.fg_bg("TelescopeResultsTitle", dark_black, dark_black)
utils.fg_bg("TelescopeResultsNormal", dark_white, dark_black)

utils.fg_bg("TelescopeSelection", white, light_black)
