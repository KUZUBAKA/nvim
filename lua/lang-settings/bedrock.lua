local dir = vim.fn.stdpath("data") .. "/bedrock-lsp"
local url = "https://github.com/Blockception/minecraft-bedrock-language-server/releases/latest/download/vscode-extension.vsix"

if not vim.uv.fs_stat(dir) then
end
