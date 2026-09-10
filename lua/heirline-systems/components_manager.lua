local M = {}

M.current_mode = { require("heirline-systems.components.current_mode") }
M.file_path = { require("heirline-systems.components.file_path") }
M.file_devicon = { require("heirline-systems.components.file_info").devicon }
M.file_type = { require("heirline-systems.components.file_info").filetype }
M.file_encoding = { require("heirline-systems.components.file_info").encoding }
M.date = { require("heirline-systems.components.clock").date }
M.diagnostics = { require("heirline-systems.components.diagnostics") }
M.chars = { require("heirline-systems.components.chars_count").chars }
M.sel_chars = require("heirline-systems.components.chars_count").sel_chars
M.cursor_pos = require("heirline-systems.components.cursor_position")

return M
