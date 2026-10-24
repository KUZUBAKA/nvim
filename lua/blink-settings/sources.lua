return {
 default = function()
  local current_filetype = vim.bo.filetype

  if current_filetype == "markdown" or current_filetype == "plaintext" then
   return { "snippets" }
  end

  return { "lsp", "path", "snippets", "buffer" }
 end,
 per_filetype = {
  lua = { inherit_defaults = true, "lazydev" },
 },
 providers = {
  buffer = {
   transform_items = function(_, items)
    return vim.tbl_filter(function(it) return it.label:match("[\128-\255]") == nil end, items)
   end,
  },
  lazydev = {
   name = "LazyDev",
   module = "lazydev.integrations.blink",
   score_offset = 100,
  },
  crates = {
   name = "crates",
   module = "blink.compat.source",
  },
  path = {
   opts = {
    get_cwd = function(context)
     if vim.g.path_src == "file" then
      local file_path = vim.api.nvim_buf_get_name(context.bufnr)
      local file_dir = vim.fs.dirname(file_path)
      return file_dir
     end
     return vim.fn.getcwd()
    end
   }
  }
 },
}
