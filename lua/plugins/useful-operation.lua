return {
 {
  -- 単語入力してジャンプ可能
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
   { "s", function() require("flash").jump() end,       desc = "Flash Jump" },
   { "S", function() require("flash").treesitter() end, desc = "Flash Jump" },
  },
  opts = {
  },
 },
 {
  -- 上下の移動を長押しで高速化
  "rhysd/accelerated-jk",
  keys = {
   { "j", "<Plug>(accelerated_jk_gj)", mode = "n" },
   { "k", "<Plug>(accelerated_jk_gk)", mode = "n" },
  },
 },
 {
  -- コメント化 コメント解除可能
  "numToStr/Comment.nvim",
  opts = {
   padding = true,
   sticky = true,
   mappings = {
    basic = true,
    extra = true,
   },
  },
 },
 {
  -- テキストケースを変更可
  "johmsalas/text-case.nvim",
  event = "VeryLazy",
  keys = {
   { "<leader>tc", function() require("textcase").current_word("to_camel_case") end,    desc = "To camelCase" },
   { "<leader>ts", function() require("textcase").current_word("to_snake_case") end,    desc = "To snake_case" },
   { "<leader>tu", function() require("textcase").current_word("to_constant_case") end, desc = "To CONSTANT_CASE" },
  },
  opts = {},
 },
 {
  -- 囲み置換
  "kylechui/nvim-surround",
  event = "VeryLazy",
  opts = {},
 },
 {
  -- 囲みから抜ける
  "ysmb-wtsg/in-and-out.nvim",
  event = "InsertEnter",
  keys = {
   {
    "<S-Tab>",
    function()
     local col = vim.api.nvim_win_get_cursor(vim.api.nvim_get_current_win())[2]
     local next = vim.api.nvim_get_current_line():sub(col + 1, col + 1)

     if vim.tbl_contains({ ")", "]", "}", '"', "'", "`" }, next) then
      require("in-and-out").in_and_out()
     else
      vim.api.nvim_feedkeys("\t", "n", false)
     end
    end,
    mode = "i",
    desc = "In and Out",
   },
  },
  opts = {},
 },
 {
  -- ウィンドウ分割時にCtrl + 矢印でサイズを変更できる
  "mrjones2014/smart-splits.nvim",
  opts = {
   ignored_buftypes = { "nofile", "quickfix", "prompt" },
  },
  keys = {
   { "<C-Left>",  function() require("smart-splits").resize_left() end,  desc = "Window: Resize Left" },
   { "<C-Down>",  function() require("smart-splits").resize_down() end,  desc = "Window: Resize Down" },
   { "<C-Up>",    function() require("smart-splits").resize_up() end,    desc = "Window: Resize Up" },
   { "<C-Right>", function() require("smart-splits").resize_right() end, desc = "Window: Resize Right" },
  },
 },
 {
  -- 数字や真偽を増減・有無を単クリで切り替え
  "monaqa/dial.nvim",
  keys = {
   { "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, mode = { "n", "x" }, desc = "increment" },
   { "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, mode = { "n", "x" }, desc = "decrement" },
  },
  config = function()
   local augend = require("dial.augend")
   require("dial.config").augends:register_group({
    default = {
     augend.integer.alias.decimal,
     augend.integer.alias.hex,
     augend.date.alias["%Y/%m/%d"],
     augend.constant.alias.bool,
     augend.semver.alias.semver,
    },
   })
  end,
 },
 {
  -- 単発でUUIDを作成する
  'TrevorS/uuid-nvim',
  lazy = true,
  opts = { case = 'lower', },
  keys = { { "<C-u>", function() require("uuid-nvim").insert_v4() end, desc = "Insert uuid" } },
 },
 {
  -- 配列などの形を開閉出来る
  "Wansmer/treesj",
  keys = {
   {
    "<leader>m",
    function()
     require("treesj").toggle()
    end,
    desc = "Toggle spilit/join",
   },
  },
  dependencies = {
   "neovim-treesitter/nvim-treesitter",
  },
  opts = function()
   local u = require("treesj.langs.utils")
   return {
    max_join_length = 5000,
    langs = { rust = { match_block = u.set_preset_for_dict({ split = { last_separator = false } }) } },
   }
  end,
 },
}
