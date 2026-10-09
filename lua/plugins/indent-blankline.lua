return {
 "lukas-reineke/indent-blankline.nvim",
 main = "ibl",
 event = { "BufReadPost", "BufNewFile" },
 ---@module "ibl"
 ---@type ibl.config
 opts = {
  indent = { char = " " },
  scope = { enabled = false },
 },
 config = function(_, opts)
  vim.api.nvim_set_hl(0, "IblIndent", { bg = "#3d4a6d" })
  require("ibl").setup(opts)
 end
}
