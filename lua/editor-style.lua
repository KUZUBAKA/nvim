local vo = vim.opt

-- 行番号表示方法
vo.number = true
vo.relativenumber = true

-- 折り返し 有効/無効
vo.wrap = true

-- 現カーソルの行のハイライト 有効/無効
vo.cursorline = true

-- 検索ヒット文字のハイライト 有効/無効
vo.hlsearch = false

-- 空行が~から置き換える
vim.opt.fillchars = { eob = " " }
