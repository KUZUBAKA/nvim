local M = require("blink-settings.manager")

vim.g.path_src = "cwd"

return
 {
  {
   "saghen/blink.cmp",
   version = "1.*",
   build = "cargo build --release",
   event = { "InsertEnter", "CmdlineEnter" },
   opts = {
   },
   config = function()
    require("blink.cmp").setup({
     keymap = M.keymaps,
     completion = M.completion,
     sources = M.sources,
     cmdline = M.cmdline,
     enabled = function() return not M.in_comment_hide() end,
    })

    -- blink.cmp v1 keeps its completion context across buffers when BufLeave
    -- happens without leaving Insert mode. That context belongs to the old
    -- buffer and can prevent a fresh request for the new filetype.
    vim.api.nvim_create_autocmd("BufEnter", {
     group = vim.api.nvim_create_augroup("BlinkCmpBufferContext", { clear = true }),
     callback = function(args)
      local trigger = require("blink.cmp.completion.trigger")
      if trigger.context and trigger.context.bufnr ~= args.buf then
       trigger.hide()
      end
     end,
    })

    vim.api.nvim_create_autocmd({ "CursorMovedI", "TextChanged", "TextChangedI", "ModeChanged" }, {
     callback = function()
      if M.in_comment_hide() then require("blink.cmp").hide() end
     end,
    })
   end,
  },
  {
   "folke/lazydev.nvim",
   dependencies = {
    "DrKJeff16/wezterm-types",
   },
   ft = "lua",
   opts = {
    library = {
     "lazy.nvim",
     vim.fn.stdpath("config") .. "/lua/types",
     { path = "wezterm-types", mods = { "wezterm" } },
    },
   },
  },
 }
