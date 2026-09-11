local M = {}

local colors = {
 fg = "#d3dde0",
 bg = "#081620",
 cursor_line = "#293241",
 selected = "#0046b1",

 blue = "#4870d5",
 blue_light = "#579ee5",
 blue_dark = "#1b3681",
 blue_gray = "#353e43",

 navy = "#343b56",

 skyblue = "#5eb0ee",
 skyblue_light = "#92c5ef",

 magenta = "#bd8dfe",

 red = "#e9444d",
 red_light = "#d75154",

 pink = "#ff649f",

 yellow = "#f6e467",
 orange = "#e4a035",
 orange_dark = "#e97e4f",

 green = "#71d29d",
 green_light = "#8df1a6",
}

local main_highlights = {
 Normal = { fg = colors.fg, bg = colors.bg }, NormalNC = { link = "Normal" },
 LineNr = { fg = colors.blue },
 LineNrAbove = { link = "LineNr" },
 LineNrBelow = { link = "LineNr" },
 CursorLineNr = { fg = colors.yellow },
 PmenuSel = { fg = colors.fg },

 FloatBorder = { fg = colors.blue },

 FlashLabel = { fg = colors.yellow },
 FlashMatch = { fg = colors.blue },
 FlashCurrent = { link = "FlashMatch" },
 FlashBackdrop = { fg = colors.green_light },

 SnacksPickerListCursorLine    = { link = "PmenuSel" },
 SnacksPickerMatch             = { fg = colors.blue },
 SnacksPickerUndoAdded         = { fg = colors.fg, bg = "NONE" },
 SnacksPickerUndoRemoved       = { fg = colors.fg, bg = "NONE" },
 SnacksPickerUndoSaved         = { fg = "NONE", bg = "NONE" },
 SnacksPickerUndoCurrent       = { fg = colors.fg, bg = "NONE" },
 SnacksDashboardIcon           = { fg = colors.skyblue },
 SnacksDashboardDesc           = { fg = colors.skyblue },
 SnacksDashboardKey            = { fg = colors.red },
 SnacksDashboardHeader         = { fg = colors.yellow },
 SnacksDashboardFooter         = { fg = colors.skyblue },

 NoiceCmdLinePopupBorder = { fg = colors.blue },
 NoiceCmdlinePopupBorderSearch = { fg = colors.yellow },

 WinSeparator = { fg = colors.blue },
 Folded = { bg = "NONE" },

 -- # Text Colors

 Comment = { fg = colors.pink },
 ["@comment"] = { link = "Comment" },

 Boolean = { fg = colors.blue_light },
 ["@boolean"] = { link = "Boolean" },

 Number = { fg = colors.fg },
 Float = { fg = colors.fg },
 ["@number"] = { link = "Number" },
 ["@number.float"] = { link = "Float" },

 Statement = { fg = colors.magenta },
 Keyword = { fg = colors.magenta },
 Include = { fg = colors.magenta },
 ["@keyword"] = { link = "Keyword" },
 ["@keyword.coroutine"] = { fg = colors.magenta },

 Function = { fg = colors.red },
 ["@function"] = { link = "Function" },

 Identifier = { fg = colors.skyblue },
 Variable = { fg = colors.fg },
 ["@variable"] = { link = "Variable" },
 ["@variable.member"] = { fg = colors.yellow },
 ["@property"] = { fg = colors.yellow },

 String = { fg = colors.green_light },
 ["@string"] = { link = "String" },

 Type = { fg = colors.blue_dark },
 Special = { fg = colors.green_light },

 Tag = { fg = colors.yellow },
 ["@tag"] = {link = "Tag"},
 ["@tag.attribute.html"] = { fg = colors.skyblue },

 -- Rust

 ["@module.rust"] = { fg = colors.blue },
 ["@lsp.type.namespace.rust"] = { fg = colors.blue },
 ["@lsp.type.attributeBracket.rust"] = {fg = colors.blue_gray},
 ["@lsp.mod.attribute.rust"] = {link = "@lsp.type.attributeBracket.rust"},
 ["@lsp.type.string.rust"] = {fg = colors.skyblue},
 ["@lsp.typemod.string.macro.rust"] = {fg = colors.skyblue},
 ["@lsp.typemod.string.procMacro"] = {fg = colors.skyblue},

 -- Lua

 ["@constructor.lua"] = { fg = colors.fg },
 ["@punctuation.bracket.lua"] = { fg = colors.fg },

 -- Markdown

 ["@markup.heading.1"] = { fg = colors.pink },
 ["@markup.heading.2"] = { fg = colors.red },
 ["@markup.heading.3"] = { fg = colors.orange },
 ["@markup.heading.4"] = { fg = colors.skyblue },
 ["@markup.heading.5"] = { fg = colors.blue },
 ["@markup.heading.6"] = { fg = colors.magenta },
 ["@markup.italic"] = { fg = colors.yellow },
 ["@markup.strong"] = { fg = colors.red_light },
 ["@markup.link.label.markdown_inline"] = { fg = colors.orange_dark },
 ["@markup.link.bracket"] = { link = "@markup.link.label.markdown_inline" },
 ["@markup.list"] = { fg = colors.skyblue_light },
 ["@markup.raw.block"] = { fg = colors.green_light },
 ["@markup.raw.markdown_inline"] = { fg = colors.green_light },
 ["@punctuation.special.markdown"] = { fg = colors.pink },
}

local no_transparent_highlights = {
 CursorLine = { bg = colors.cursor_line },
 Visual = { bg = colors.selected },
 VisualNOS = { link = "Visual" },
 PmenuSel = { link = "CursorLine" },
 SnacksPickerListCursorLine = { link = "PmenuSel" },

 StatusLine = { fg = colors.skyblue_light, bg = "NONE" },

 WinBar      = { fg = colors.skyblue_light, bg = "NONE" },
 WinBarNC    = { fg = colors.blue_gray,     bg = "NONE" },
 WinBarFP    = { fg = colors.skyblue_light, bg = colors.navy },
 WinBarFPSep = { fg = colors.navy,          bg = "NONE" },

 HlFilePath = { fg = colors.fg,            bg = colors.navy },
 HlSepFPR   = { fg = colors.blue,          bg = colors.navy },
 HlFileType = { fg = colors.skyblue,       bg = colors.navy },
 HlSepFTR   = { fg = colors.navy,          bg = "NONE" },

 HlCursorPosSep   = { fg = colors.navy,          bg = "NONE" },
 HlCursorPos      = { fg = colors.skyblue_light, bg = colors.navy },
 HlCharsSep       = { fg = colors.navy,          bg = colors.navy },
 HlChars          = { fg = colors.skyblue_light, bg = colors.navy },
 HlSelChars       = { fg = colors.skyblue_light, bg = colors.navy },
 HlDiagnosticsSep = { fg = colors.navy,          bg = colors.navy },
 HlDiagnostics    = { fg = colors.skyblue_light, bg = colors.navy },
 DiagnosticError = { fg = colors.red },
 DiagnosticWarn  = { fg = colors.yellow },
 DiagnosticHint  = { fg = colors.blue },
 DiagnosticInfo  = { fg = colors.skyblue },

 HlDate    = { fg = colors.skyblue_light, bg = colors.navy },
 HlSepDate = { fg = colors.navy,          bg = "NONE" },
}

local blink_colors = {
 bg = "#1b2a38",
}

local blink_highlights = {
 BlinkCmpMenu = { fg = colors.fg, bg = blink_colors.bg },
 BlinkCmpLabelMatch = { fg = colors.blue },
 BlinkCmpMenuBorder = { fg = colors.blue, bg = blink_colors.bg },
 BlinkCmpMenuSelection = { link = "CursorLine" },
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
 if not (opts.transparent and opts.transparent_cmp) then
  hl = vim.tbl_extend("force", hl, blink_highlights)
 end

 for group, h_opts in pairs(hl) do
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", h_opts, decoration_status))
 end
end

return M
