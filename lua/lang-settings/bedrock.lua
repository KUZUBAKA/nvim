local dir = vim.fn.stdpath("data") .. "/bedrock-lsp"
local url = "https://github.com/Blockception/minecraft-bedrock-language-server/releases/latest/download/vscode-extension.vsix"

if not vim.uv.fs_stat(dir) then
 vim.fn.system({ "curl", "-sL", "--create-dirs", "-o", dir .. "/vscode-extension.vsix", url })
 vim.fn.system({ "unzip", "-oq", dir .. "/vscode-extension.vsix", "extension/lsp/server.js", "extension/minecraft-*/syntax.tmLanguage.json", "-d", dir })
 vim.fn.delete(dir .. "/vscode-extension.vsix")
end

return function()
 vim.lsp.config("bedrock", {
  cmd = { "node", dir .. "/extension/lsp/server.js", "--stdio" },
 })
end
