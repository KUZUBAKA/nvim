local dir = vim.fn.stdpath("data") .. "/bedrock-scripts"
local cmd = {
 "npm",
 "install",
 "--prefix",
 dir,
 "--no-package-lock",
 "--no-audit",
 "--no-fund",
 "typescript@6",
 "typescript-language-server",
}

if not vim.uv.fs_stat(dir) then
 vim.fn.system(cmd)
end

local api = {
 "npm",
 "install",
 "--prefix",
 dir,
 "--no-package-lock",
 "--no-audit",
 "--no-fund",
 "@minecraft/server@beta",
 "@minecraft/server-ui@beta",
 "@minecraft/debug-utilities@beta",
 "@minecraft/server-gametest@beta",
}

if not vim.uv.fs_stat(dir .. "/node_modules/@minecraft") then
 vim.fn.system(api)
end

return function()
 vim.lsp.config("ts_ls", {
  cmd = { dir .. "/node_modules/.bin/typescript-language-server", "--stdio" },
 })
end
