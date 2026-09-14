return function()
 vim.lsp.config("jsonls", {
  settings = {
   json = {
    validate = { enable = true },
    schemas = {
     {
      fileMatch = { "manifest.json" },
      url = "https://raw.githubusercontent.com/Blockception/Minecraft-bedrock-json-schemas/main/general/manifest.json",
     },
    },
   },
  },
 })
end
