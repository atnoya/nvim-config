local utils = require("functions")

local light_black = "#3D3D3D"
local dark_black = "#222222"
local dark_white = "#BBBBBB"
local white = "#EEEEEE"

local M = {}

M.set_telescope_custom_colors = function()
  -- Telescope
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

  utils.fg_bg("TelescopeSelection", white, dark_black, "bold")
  utils.fg("TelescopeSelectionCaret", "#BB4444", "bold")

  -- Telescope custom LSP entries
  utils.fg("TelescopeCustomSymbolPath", "#666666")
end


M.set_indent_blank_line_custom_colors = function()
  -- Blank line
  utils.fg("IndentBlanklineContextPattern", "#DDDDDD", "nocombine")
  utils.fg("IndentBlanklineContextChar", "#CCCCCC", "nocombine")
end

return M
