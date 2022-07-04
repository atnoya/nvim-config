local api = vim.api
local cmd = vim.cmd

local M = {}

M.get_config = function(name)
  return string.format('require("config/%s")', name)
end

-- Highlights functions

-- Define bg color
-- @param group Group
-- @param color Color
-- @param gui bold or other

M.bg = function(group, col, gui)
  local resolved = gui or "NONE"
  cmd("hi " .. group .. " guibg=" .. col .. " gui=" .. resolved)
end

-- Define fg color
-- @param group Group
-- @param color Color
-- @param gui bold or other
M.fg = function(group, col, gui)
  local resolved = gui or "NONE"
  cmd("hi " .. group .. " guifg=" .. col .. " gui=" .. gui)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
-- @param gui bold or other
M.fg_bg = function(group, fgcol, bgcol, gui)
  local resolved = gui or "NONE"
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol .. " gui=" .. resolved)
end

return M 
