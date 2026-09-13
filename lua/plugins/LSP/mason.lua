return {
 {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
   "mason-org/mason.nvim",
   "neovim/nvim-lspconfig",
  },
  config = function()
   require("mason-lspconfig").setup({
    ensure_installed = {
     "lua_ls",
     "jsonls",
     "yamlls",
     "clangd",
     "pyright",
     "intelephense",
     "lemminx",
     "rust_analyzer",
     "html",
     "emmet_language_server",
     "cssls",
     "ts_ls",
     "ruby_lsp",
     "sqlls",
    },
   })

   require("lang-settings.lua_ls")()
   require("lang-settings.jsonls")()
   require("lang-settings.yamlls")()
   require("lang-settings.rust_analyzer")()
   require("lang-settings.emment_language_server")()
   require("lang-settings.gdscript")()

   vim.lsp.enable("lua_ls")
   vim.lsp.enable("jsonls")
   vim.lsp.enable("yamlls")
   vim.lsp.enable("clangd")
   vim.lsp.enable("pyright")
   vim.lsp.enable("intelephense")
   vim.lsp.enable("lemminx")
   vim.lsp.enable("rust_analyzer")
   vim.lsp.enable("html")
   vim.lsp.enable("cssls")
   vim.lsp.enable("emmet_language_server")
   vim.lsp.enable("ts_ls")
   vim.lsp.enable("ruby_lsp")
   vim.lsp.enable("gdscript")
   vim.lsp.enable("sqlls")
  end,
 },
 {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
   "mason-org/mason.nvim",
  },
  opts = {
   ensure_installed = {
    "stylua",
    "biome",
    "black",
    "flake8",
    "eslint_d",
    "prettier",
    "prettierd",
   },
  },
 },
 {
  "mason-org/mason.nvim",
  opts = {},
 },
 {
  "b0o/SchemaStore.nvim",
 },
 {
  "neovim/nvim-lspconfig",
 },
 {
  "mason-org/mason.nvim",
  opts = {},
 },
 {
  "b0o/SchemaStore.nvim",
 },
 {
  "neovim/nvim-lspconfig",
 },
}
