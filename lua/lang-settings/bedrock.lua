local dir = vim.fn.stdpath("data") .. "/bedrock-lsp"
local url = "https://github.com/Blockception/minecraft-bedrock-language-server/releases/latest/download/vscode-extension.vsix"

if not vim.uv.fs_stat(dir) then
 vim.fn.system({ "curl", "-sL", "--create-dirs", "-o", dir .. "/vscode-extension.vsix", url })
 vim.fn.system({ "unzip", "-oq", dir .. "/vscode-extension.vsix", "extension/lsp/server.js", "extension/minecraft-*/syntax.tmLanguage.json", "-d", dir })
end

return function()
end
