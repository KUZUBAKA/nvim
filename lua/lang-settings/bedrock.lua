local dir = vim.fn.stdpath("data") .. "/bedrock-lsp"
local url = "https://github.com/Blockception/minecraft-bedrock-language-server/releases/latest/download/vscode-extension.vsix"
local ids = {
 mcfunction = "bc-mcfunction",
 lang = "bc-minecraft-language",
}

if not vim.uv.fs_stat(dir) then
 vim.fn.system({ "curl", "-sL", "--create-dirs", "-o", dir .. "/vscode-extension.vsix", url })
 vim.fn.system({ "unzip", "-oq", dir .. "/vscode-extension.vsix", "extension/lsp/server.js", "extension/minecraft-*/syntax.tmLanguage.json", "-d", dir })
 vim.fn.delete(dir .. "/vscode-extension.vsix")
end

return function()
 vim.lsp.config("bedrock", {
  cmd = { "node", dir .. "/extension/lsp/server.js", "--stdio" },
  filetypes = { "mcfunction", "lang" },
  root_markers = { ".mclint", "manifest.json", ".git" },
  get_language_id = function(_, ft) return ids[ft] end,
 })
end
