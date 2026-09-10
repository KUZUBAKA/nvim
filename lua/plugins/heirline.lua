return {
 "rebelot/heirline.nvim",
 event = "UiEnter",
 config = function()

  -- Neovim標準の表示を全て無効化する
  local vo = vim.o

  vo.laststatus = 0
  vo.showtabline = 0
  vo.showmode = false
  vo.ruler = false
  vo.showcmd = false
  vo.cmdheight = 0

  require("heirline").setup({
   -- statusline = require("heirline-systems.statusline"),
   -- tabline = require("heirline-systems.tabline"),
   statuscolumn = require("heirline-systems.statuscolumn"),
   winbar = require("heirline-systems.statusline"),

   opts = {
    disable_winbar_cb = function(args)
     local buftype = vim.bo[args.buf].buftype
     local disable_buftypes = {
      "nofile",
      "help",
      "terminal",
      "quickfix",
      "acwrite",
     }
     if vim.tbl_contains(disable_buftypes, buftype) then return true end
    end,
   },
  })
 end,
}
