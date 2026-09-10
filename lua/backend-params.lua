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

 -- … と ※
 -- { 0x2026,  0x2026,  2 },
 { 0x203B,  0x203B,  2 },

 -- ℃ ℉ № ™ Ω Å など
 { 0x2103,  0x2103,  2 },
 { 0x2109,  0x2109,  2 },
 { 0x2116,  0x2116,  2 },
 { 0x2122,  0x2122,  2 },
 { 0x2126,  0x2126,  2 },
 { 0x212B,  0x212B,  2 },

 -- 矢印：← ↑ → ↓ ⇒ ⇔ など
 { 0x2190,  0x21FF,  2 },

 -- 数学記号：∀ ∂ ∞ ≠ ≤ ≥ など
 { 0x2200,  0x22FF,  2 },

 -- 電源記号など：⏻ ⏼ ⏽ ⏾
 { 0x23FB,  0x23FE,  2 },

 -- 丸数字・囲み文字：① ② ⓪ など
 { 0x2460,  0x24FF,  2 },

 -- 図形記号：■ □ ● ○ ◆ ◇ ★ ☆ など
 -- 罫線 2500-257F は入れない
 { 0x25A0,  0x25FF,  2 },

 -- 天気・警告・装飾・チェック・太い矢印：☀ ♨ ⚠ ✓ ✔ ➡ など
 -- ここに 27A0-27BF も含まれるので、別指定しない
 { 0x2600,  0x27BF,  2 },

 -- 補助矢印・補助数学記号
 -- Braille 2800-28FF は入れない
 { 0x27C0,  0x27FF,  2 },
 { 0x2900,  0x2AFF,  2 },

 -- 追加の矢印・記号
 { 0x2B00,  0x2BFF,  2 },

 -- Nerd Fonts：BMP 私用領域
 { 0xE000,  0xE0AF,  2 },
 { 0xE0C0,  0xF8FF,  2 },

 -- Nerd Fonts：Material Design Icons など
 { 0xF0000, 0xF1FFF, 2 },
})
