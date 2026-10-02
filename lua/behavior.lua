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
 callback = function() vim.bo.commentstring = "# %s" end,
})

vim.api.nvim_create_autocmd("FileType", {
 pattern = "lang",
 callback = function() vim.bo.commentstring = "## %s" end,
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

-- フォントの幅を日本語用に再設定
vim.fn.setcellwidths({
 -- Latin-1 系の曖昧幅記号：± × ÷ ° など
 { 0x00A1,  0x00A1,  2 },
 { 0x00A4,  0x00A4,  2 },
 { 0x00A7,  0x00A8,  2 },
 { 0x00AA,  0x00AA,  2 },
 { 0x00AC,  0x00AC,  2 },
 { 0x00AE,  0x00BA,  2 },
 { 0x00BC,  0x00BF,  2 },
 { 0x00D7,  0x00D7,  2 },
 { 0x00F7,  0x00F7,  2 },

 -- ※ (… は 1 マスのまま)
 { 0x203B,  0x203B,  2 },

 -- ℃ ℉ № ™ Ω Å
 { 0x2103,  0x2103,  2 },
 { 0x2109,  0x2109,  2 },
 { 0x2116,  0x2116,  2 },
 { 0x2122,  0x2122,  2 },
 { 0x2126,  0x2126,  2 },
 { 0x212B,  0x212B,  2 },

 -- 矢印・数学記号・技術記号：← → ⇒ ∀ ≠ ⌘ ⏻ など
 { 0x2190,  0x23FF,  2 },

 -- 丸数字・囲み文字：① ② ⓪ など
 { 0x2460,  0x24FF,  2 },

 -- 図形・天気・装飾・チェック・補助矢印：■ ● ★ ⚠ ✓ ➡ など
 -- 罫線 2500-259F と点字 2800-28FF は入れない
 { 0x25A0,  0x27FF,  2 },
 { 0x2900,  0x2BFF,  2 },

 -- Nerd Fonts (Powerline の区切り E0B0-E0BF は入れない)
 { 0xE000,  0xE0AF,  2 },
 { 0xE0C0,  0xF8FF,  2 },
 { 0xF0000, 0xF1FFF, 2 },
})
