local vo = vim.o

vo.clipboard = "unnamedplus"
vo.foldlevel = 99
vo.foldlevelstart = 99
vo.foldenable = true
vo.report = 999999999
vim.bo.omnifunc = "syntaxcomplete#Complete"
vim.opt.fixeol = false
vim.opt.conceallevel = 0
vim.opt.fileformats = { "unix", "dos" }

-- Minecraft Addon For FileType Set

vim.filetype.add({ extension = { mcfunction = "mcfunction" } })
vim.filetype.add({ extension = { lang = "lang" } })

vim.api.nvim_create_autocmd("FileType", {
 pattern = "mcfunction",
 callback = function() vim.bo.commentstringt = "# %s" end,
})

vim.api.nvim_create_autocmd("FileType", {
 pattern = "lang",
 callback = function() vim.bo.commentstringt = "# %s" end,
})

-- Indent Format
vim.api.nvim_create_autocmd("BufWritePre", {
 callback = function()
  local v = vim.fn.winsaveview();
  pcall(vim.cmd, "silent undojoin");
  vim.cmd("keepjumps normal! gg=G");
  vim.fn.winrestview(v);
 end
})

-- Comment
vim.api.nvim_create_autocmd("BufEnter", {
 pattern = "*",
 callback = function() vim.opt.formatoptions:remove({ "c", "r", "o" }) end,
})
