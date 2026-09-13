return function()
 vim.lsp.config("jsonls", {
  settings = { json = { schemas = {} } },
 })
end
