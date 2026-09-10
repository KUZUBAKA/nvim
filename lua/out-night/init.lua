local M = {}

local colors = {
 fg = "#e8e8e8",
 bg = "#262730",
}

local main_highlights = {
 Normal = { fg = fg, bg = bg },
}

local no_transparent_highlights = {
}

-- opts=trueだった場合に何を無効にするか？の設定
local disabled_decorations = {
 underline = false,
 bold = false,
 italic = false,
}

function M.setup(opts)
 vim.cmd("highlight clear")
 vim.cmd("syntax reset")

 if opts ~= nil and opts then
  for _, h_opts in pairs(main_highlights) do
   h_opts.bg = "NONE"
  end
 end

 local hl = vim.tbl_extend("force", vim.api.nvim_get_hl(0, { link = false }), main_highlights)
 hl = vim.tbl_extend("force", hl, no_transparent_highlights)

 for group, h_opts in pairs(hl) do
  vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", h_opts, disabled_decorations))
 end
end

return M
