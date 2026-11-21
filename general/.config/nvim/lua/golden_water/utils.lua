local M = {}

---@param modes? string | string[]
---@param keys string
---@param func string | function
---@param desc string
function M.map(keys, func, desc, modes)
  modes = modes or 'n'
  vim.keymap.set(modes, keys, func, { desc = desc })
end

---@param repo string
---@return string
function M.gh(repo)
  return 'https://github.com/' .. repo
end

return M
