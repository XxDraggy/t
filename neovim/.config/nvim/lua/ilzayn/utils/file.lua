local M = { }

local name_to_name = {
  [""] = "[No Name]",
}
local type_to_name = {
  ["TelescopePrompt"] = "Telescope",
  ["help"] = "Help",
  ["oil"] = "Oil",
  ["mason"] = "Mason",
}

function M.file_path_to_name(file_path)
  return vim.fn.fnamemodify(file_path, ":t")
end

function M.get_file_flags()
  local flag = ""

  if vim.bo.modified then
    flag = ""
  end
  if vim.bo.modifiable == false or vim.bo.readonly == true then
    flag = "󰌾"
  end

  return flag
end

function M.get_file_type()
  local file_type = vim.bo.filetype

  if type_to_name[file_type] then
    file_type = ""
  end

  return file_type
end

function M.get_file_name()
  local name = M.file_path_to_name(vim.fn.expand("%"))
  local type = vim.bo.filetype

  if type_to_name[type] then
    name = type_to_name[type]
  elseif name_to_name[name] then
    name = name_to_name[name]
  end

  return name
end

function M.get_file_icon()
  local success, devicons = pcall(require, "nvim-web-devicons")

  if not success then
    return ""
  end

  local icon = devicons.get_icon(M.get_file_name(), M.get_file_type())

  return icon
end

return M
