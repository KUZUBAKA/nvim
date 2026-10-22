local vg = vim.g
local map = vim.keymap.set

vg.mapleader = " "
vg.maplocalleader = "\\"

local map = vim.keymap.set

map("n", "Y", "y$", { desc = "行末までヤンク" })
map("n", "y<C-a>", "<cmd>%y<cr>", { desc = "ファイル全体のコピー" })
map("i", "<Esc>", "<Space><BS><Esc>")
map("i", "<CR>", "<Space><BS><CR>")
map("", "K", "")
map({"n", "x", "i"}, "<C-z>", "u")
-- map("n", "<C-A-k>", function()
--  vim.lsp.buf.hover({ on_list = jump_first })
-- end, { desc = "ファイル全体のコピー" })

map("n", "<C-A-f>", function()
 vim.lsp.buf.definition({ on_list = jump_first })
end, { desc = "ファイル全体のコピー" })

-- map("n", "<C-A-s>", function()
--  vim.lsp.buf.implementation({ on_list = jump_first })
-- end, { desc = "ファイル全体のコピー" })

map("n", "<leader>]", function()
 vim.cmd("bnext")
end, { desc = "Next buffer" })

map("n", "<leader>[", function()
 vim.cmd("bprevious")
end, { desc = "Previous buffer" })

map(
 "n",
 "<leader>bd",
 function()
  local is_no_name = vim.bo[0].filetype == nil and true or false
  vim.api.nvim_buf_delete(0, { force = is_no_name })
 end,
 { desc = "Close buffer" }
)
