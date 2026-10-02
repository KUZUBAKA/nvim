local vg = vim.g
local vo = vim.o

-- ファイルのエンコーディング
vo.encoding = "utf-8"

-- Neovim標準のバックアップファイルを作成しないようにする
vo.swapfile = false

-- ファイル特有の外観を無効化
vg.loaded_matchparen = 1
vg.markdown_recommended_style = 0
vg.rust_recommended_style = false
vg.python_recommended_style = 0

-- Filetype==Nonameの時にMarkdown形式のファイルとして認識させる
vim.api.nvim_create_autocmd("BufEnter", {
 callback = function(args)
  if vim.bo[args.buf].buftype == "" and vim.bo[args.buf].filetype == "" then vim.cmd("set filetype=markdown") end
 end,
})

-- コマンド受付時間の設定
vo.timeoutlen = 5000

-- 補完で使うPathの基準を切り替えるコマンド設定
vim.api.nvim_create_user_command("PathToggle", function()
 if vim.g.path_src == "cwd" then
  vim.g.path_src = "file"
  vim.notify("パス補完起点: 現ファイル", vim.log.levels.INFO)
 else
  vim.g.path_src = "cwd"
  vim.notify("パス補完起点: プロジェクトルート", vim.log.levels.INFO)
 end
end, { desc = "Toggle path comletion soruce bitween cwd and current file" })
