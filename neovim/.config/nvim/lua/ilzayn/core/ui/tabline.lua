local utils = require("ilzayn.utils")
local M = { separators = { left = "", right = "" } }

-- tab naming
M.tab_names = { }
function M.set_tab_name(tab_index, tab_name)
  if tab_index == 0 then
    tab_index = vim.api.nvim_get_current_tabpage()
  end

  M.tab_names[tab_index] = tab_name
end
function M.load_tab_names()
  local ok, names_to_number = pcall(vim.json.decode, vim.g.TabNames)

  if not (ok and type(names_to_number) == 'table') then
    return
  end

  for _, tabid in ipairs(vim.api.nvim_list_tabpages()) do
    local tab_num = vim.api.nvim_tabpage_get_number(tabid)
    local name = names_to_number[tab_num]

    if name ~= nil then
      M.tab_names[tostring(tabid)] = name
    end
  end
end
function M.save_tab_names()
  local names_to_number = {}

  for tabid, name in pairs(M.tab_names) do
    local ok, tab_num = pcall(vim.api.nvim_tabpage_get_number, tonumber(tabid))

    if ok then
      names_to_number[tostring(tab_num)] = name
    end
  end
  vim.g.TabNames = vim.json.encode(names_to_number)
end

function M.tab(tab_index, tab_id)
  local is_active = vim.fn.tabpagenr() == tab_index

  local tab_name = M.tab_names[tab_index]

  local is_modified = false
  local tab_windows = vim.tbl_filter(
    function(window) return vim.api.nvim_win_get_config(window).relative == '' end,
    vim.api.nvim_tabpage_list_wins(tab_id)
  )
  for _, window in ipairs(tab_windows) do
    if pcall(vim.api.nvim_win_get_buf, window) then
      local bufid = vim.api.nvim_win_get_buf(window)
      if vim.bo[bufid].modified then
        is_modified = true
        break
      end
    end
  end
  local modified = is_modified and " " or ""

  local content = table.concat({
    " ",
    tab_index,
    tab_name == nil and "" or table.concat({ " - ", tab_name }),
    modified,
    " ",
  })

  return utils.highlight_module(M.separators, content, is_active)
end

local loaded = false
function M.tabline()
  if not loaded then
    M.load_tab_names()
    loaded = true
  else
    M.save_tab_names()
  end

  local tabline = M.tab(1, vim.api.nvim_list_tabpages()[1])

  for tab_index = 2, vim.fn.tabpagenr("$"), 1 do
    local tab_id = vim.api.nvim_list_tabpages()[tab_index]

    tabline = table.concat({
      tabline,
      M.tab(tab_index, tab_id),
    }, "  ")
  end
  tabline = table.concat({ tabline, "%#Normal#" })

  return tabline
end

Tabline = M.tabline

vim.opt.tabline = "%!v:lua.Tabline()"

return M
