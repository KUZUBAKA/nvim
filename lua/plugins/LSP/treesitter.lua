return {
 {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
   local install_filetypes = {
    "lua",
    "python",
    "javascript",
    "glimmer_javascript",
    "rust",
    "rstml",
    "json",
    "yaml",
    "xml",
    "html",
    "html_tags",
    "css",
    "markdown",
    "markdown_inline",
    "gdscript",
    "vimdoc",
    "c",
    "cpp",
   }

   require("nvim-treesitter").install(install_filetypes)

   vim.api.nvim_create_autocmd("FileType", {
    pattern = install_filetypes,
    callback = function()
     vim.treesitter.start()
     if vim.bo.filetype ~= "rust" then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
     end
    end,
   })
  end,
 },
 {
  "mrxiaozhuox/dioxus.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  init = function()
   vim.env.USERPROFILE = vim.env.USERPROFILE or vim.env.HOME
  end,
  ft = "rust",
  opts = {
   format = {
    split_line_attributes = false,
   },
  },
 },
}
