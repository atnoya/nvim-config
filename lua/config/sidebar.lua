require("sidebar-nvim").setup({
  open = true,
  hide_statusline = true,
  sections = {
    "files", 
    "diagnostics", 
    "symbols", 
    require("dap-sidebar-nvim.breakpoints"),
    "git", 
    "todos"
  },
  bindings = { 
    ["q"] = function() require("sidebar-nvim").close() end
  },
  dap = {
    breakpoints = {
      icon = "🔍",
      -- bindings = {
      --   ["t"] = function(line)
      --             loclist:toggle_group_at(line)
      --         end,
      -- }
    },
  }
})
