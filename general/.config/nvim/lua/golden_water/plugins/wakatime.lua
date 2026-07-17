local wakatime_cfg = vim.fn.expand('~'):gsub('\\', '/') .. '/.wakatime.cfg'

local stat, err, name = vim.uv.fs_stat(wakatime_cfg)
if stat == nil and name == 'ENOENT' then
  return {}
elseif stat ~= nil then
  return {
    'wakatime/vim-wakatime',
  }
else
  error(err)
end
