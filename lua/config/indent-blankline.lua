vim.opt.list = true

require("custom-colors").set_indent_blank_line_custom_colors()

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = true,
    use_treesitter_scope = true,
    filetype_exclude = {
      "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
      "packer", "vimwiki", "txt", "vista", "help",
      "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
      "flutterToolsOutline", "" -- for all buffers without a file type
    },
    buftype_exclude = {"terminal", "nofile"},
    context_pattern_highlight = "IndentBlanklineContextPattern"
  }
