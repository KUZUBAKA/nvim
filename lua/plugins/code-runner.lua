return {
 "CRAG666/code_runner.nvim",
 event = "VeryLazy",
 keys = {
  { "<leader>rr", function() require("code_runner").run_filetype() end, desc = "Code run" },
 },
 opts = {
  prefix = "",
  mode = "toggleterm",
  focus = false,
  float = {
   border = "rounded",
  },
  filetype = {
   python = "python -u",
   rust = "cargo run$end",
  },
 },
}
