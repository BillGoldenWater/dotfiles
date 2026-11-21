local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then
      output = 'No output from build command.'
    end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then
      return
    end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
        run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
      end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then
        vim.cmd.packadd 'nvim-treesitter'
      end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

local gh = require('golden_water.utils').gh
local map = require('golden_water.utils').map
vim.pack.add { gh 'NMAC427/guess-indent.nvim' }
require('guess-indent').setup {}

vim.pack.add { gh 'tpope/vim-abolish' }

vim.pack.add { gh 'christoomey/vim-tmux-navigator' }

vim.pack.add { gh 'nvim-lua/plenary.nvim' }
vim.pack.add { gh 'folke/todo-comments.nvim' }
require('todo-comments').setup { signs = false }

vim.pack.add { gh 'tpope/vim-fugitive' }
map('<leader>gs', vim.cmd.Git, 'Git Status')

vim.pack.add {
  {
    src = 'https://github.com/kylechui/nvim-surround',
    version = vim.version.range '4.x',
  },
}

vim.pack.add { gh 'chrisgrieser/nvim-origami' }
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
require('origami').setup {}

vim.pack.add { gh 'mbbill/undotree' }
map('<leader>u', vim.cmd.UndotreeToggle, '[U]ndotreeToggle')

local plugins = vim.fn.stdpath 'config' .. '/lua/golden_water/plugins/'
local entries = vim.fn.globpath(plugins, '*', false, true)
for _, path in ipairs(entries) do
  local name = vim.fn.fnamemodify(path, ':t')
  if string.sub(name, 1, 1) == '.' then
    goto continue
  end
  if name:sub(-4) ~= '.lua' then
    goto continue
  end

  dofile(path)

  ::continue::
end
