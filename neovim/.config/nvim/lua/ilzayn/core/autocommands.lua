local function augroup(name)
  return vim.api.nvim_create_augroup("ilzayn_" .. name, { clear = true })
end
