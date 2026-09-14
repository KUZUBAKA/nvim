local dir = vim.fn.stdpath("data") .. "/bedrock-scripts"
local cmd = { "npm", "install", "--prefix", dir, "--no-package-lock", "--no-audit" ,"--no-fund", "typescript@6", "typescript-language-server" }

if not vim.uv.fs_stat(dir) then
 vim.fn.system(cmd)
end

return function()
 vim.lsp.config("ts_ls", {
  cmd = { dir .. "/node_modules/.bin/typescript-language-server", " --stdio" },
 })
end
