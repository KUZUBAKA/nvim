local M = {}

local colors = {
 fg = "#d3dde0",
 bg = "#081620",
 selected = "#293241",

 blue = "#4870d5",
 blue_dark = "#1b3681",

 yellow = "#fee404",
 orange = "#e4a035",

 green = "#71d29d",
}

local main_highlights = {
 Normal = { fg = colors.fg, bg = colors.bg },
 NormalNC = { link = "Normal" },

 LineNr = { fg = colors.blue },
 LineNrAbove = { link = "LineNr" },
 LineNrBelow = { link = "LineNr" },
 CursorLineNr = { fg = colors.yellow },

 FlashLabel = { fg = colors.yellow },
 FlashMatch = { fg = colors.blue },
 FlashCurrent = { link = "FlashMatch" },
 FlashBackdrop = { fg = colors.green_light },

 --
 -- NoiceCmdLinePopup             = { link = "Pmenu" },
 -- NoiceCmdLinePopupBorder       = { fg = colors.blue, bg = colors.gray_dark },
 -- NoiceCmdlinePopupBorderSearch = { fg = colors.yellow, bg = colors.gray_dark },
}

local no_transparent_highlights = {
 CursorLine = { fg = colors.fg, bg = colors.selected },
 Visual = { bg = colors.selected },
 VisualNOS = { link = "Visual" },
 PmenuSel = { link = "Visual" },
}

local blink_colors = {
 bg = "#3c494f",
}

local blink_highlights = {
 BlinkCmpMenu = { fg = colors.fg, bg = blink_colors.bg },
 BlinkCmpLabelMatch = { fg = colors.blue },
 BlinkCmpMenuBorder = { fg = colors.blue },
 BlinkCmpMenuSelection = { fg = colors.fg, bg = colors.selected },
 BlinkCmpDoc = { link = "BlinkCmpMenu" },
 BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
}

function M.setup(opts)
 -- 初期の色設定を全て無効化
 vim.cmd("highlight clear")
 vim.cmd("syntax reset")

 local decoration_status = {
  underline = true,
  bold = true,
  italic = true,
 }
 local hl = vim.tbl_extend("force", vim.api.nvim_get_hl(0, { link = false }), main_highlights)

 if opts.transparent ~= nil and opts.transparent then
  if opts.transparent_cmp == nil or opts.transparent_cmp then
   hl = vim.tbl_extend('force', hl, blink_highlights)
   opts.transparent_cmp = true
  end
  for _, h_opts in pairs(hl) do h_opts.bg = "NONE" end
 end

 if opts.bold ~= nil and (not opts.bold) then
  decoration_status.bold = false
 end

 if opts.italic ~= nil and (not opts.italic) then
  decoration_status.italic = false
 end

 if opts.underline ~= nil and (not opts.underline) then
  decoration_status.underline = false
 end

 hl = vim.tbl_extend("force", hl, no_transparent_highlights)
 if not opts.transparent_cmp then
  hl = vim.tbl_extend("force", hl, blink_highlights)
 end

 for group, h_opts in pairs(hl) do
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", h_opts, decoration_status))
 end
end

return M
