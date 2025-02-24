local mode_utils = { }

mode_utils.mode_type = {
  ["n"]      = "normal",
  ["no"]     = "normal",
  ["nov"]    = "normal",
  ["noV"]    = "normal",
  ["no\22"]  = "normal",
  ["niI"]    = "normal",
  ["niR"]    = "normal",
  ["niV"]    = "normal",
  ["nt"]     = "normal",
  ["ntT"]    = "normal",
  ["v"]      = "visual",
  ["vs"]     = "visual",
  ["V"]      = "visual",
  ["Vs"]     = "visual",
  ["\22"]    = "visual",
  ["\22s"]   = "visual",
  ["s"]      = "visual",
  ["S"]      = "visual",
  ["\19"]    = "visual",
  ["i"]      = "insert",
  ["ic"]     = "insert",
  ["ix"]     = "insert",
  ["R"]      = "replace",
  ["Rc"]     = "replace",
  ["Rx"]     = "replace",
  ["Rv"]     = "replace",
  ["Rvc"]    = "replace",
  ["Rvx"]    = "replace",
  ["c"]      = "command",
  ["cv"]     = "command",
  ["ce"]     = "command",
  ["r"]      = "replace",
  ["rm"]     = "command",
  ["r?"]     = "command",
  ["!"]      = "normal",
  ["t"]      = "terminal",
}
function mode_utils.get_mode_type()
  local mode = vim.api.nvim_get_mode().mode

  return mode_utils.mode_type[mode]
end

mode_utils.mode_name = {
  ["n"]      = "NORMAL",
  ["no"]     = "O-PENDING",
  ["nov"]    = "O-PENDING",
  ["noV"]    = "O-PENDING",
  ["no\22"]  = "O-PENDING",
  ["niI"]    = "NORMAL",
  ["niR"]    = "NORMAL",
  ["niV"]    = "NORMAL",
  ["nt"]     = "NORMAL",
  ["ntT"]    = "NORMAL",
  ["v"]      = "VISUAL",
  ["vs"]     = "VISUAL",
  ["V"]      = "V-LINE",
  ["Vs"]     = "V-LINE",
  ["\22"]    = "V-BLOCK",
  ["\22s"]   = "V-BLOCK",
  ["s"]      = "SELECT",
  ["S"]      = "S-LINE",
  ["\19"]    = "S-BLOCK",
  ["i"]      = "INSERT",
  ["ic"]     = "INSERT",
  ["ix"]     = "INSERT",
  ["R"]      = "REPLACE",
  ["Rc"]     = "REPLACE",
  ["Rx"]     = "REPLACE",
  ["Rv"]     = "V-REPLACE",
  ["Rvc"]    = "V-REPLACE",
  ["Rvx"]    = "V-REPLACE",
  ["c"]      = "COMMAND",
  ["cv"]     = "EX",
  ["ce"]     = "EX",
  ["r"]      = "REPLACE",
  ["rm"]     = "MORE",
  ["r?"]     = "CONFIRM",
  ["!"]      = "SHELL",
  ["t"]      = "TERMINAL",
}
function mode_utils.get_mode_name()
  local mode = vim.api.nvim_get_mode().mode

  return mode_utils.mode_name[mode]
end

function mode_utils.get_mode_highlight(reversed)
  local mode_type = mode_utils.get_mode_type()
  local highlight_group = table.concat({
    mode_type,
    "_mode",
    reversed == true and "_reversed" or "",
  })

  return highlight_group
end

return mode_utils
