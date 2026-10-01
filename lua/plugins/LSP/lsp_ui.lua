return {
 "jinzhongjia/LspUI.nvim",
 branch = "main",
 event = "LspAttach",
 keys = {
  { "<leader>lr", "<cmd>LspUI rename<cr>", desc = "Rename" },
  { "<leader><C-A-k>", "<cmd>LspUI hover<cr>", desc = "型情報や作者情報を確認" },
  { "<leader><C-A-f>", "<cmd>LspUI definition<cr>", desc = "関数の処理を確認" },
  { "<leader><C-A-t>", "<cmd>LspUI implementation<cr>", desc = "トレイトの処理を確認" },
 },
 opts = {
  inlay_hint = {
   enable = true,
   filter = {
    whitelist = { "rust" },
   }
  },
  rename = {
   enable = true,
   border = "rounded",
   transparency = 0,
   auto_select = false,
  },
  hover = {
   enable = true,
   border = "rounded",
   transparency = 0,
  },
  definition = {
   enable = true,
   border = "rounded",
   transparency = 0,
  },
  diagnostic = {
   enable = false,
  },
 },
}
