local vo = vim.o

vo.clipboard = "unnamedplus"

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
