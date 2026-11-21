-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
--  WARN: Put all other keymap after this
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.loader.enable()

-- neovide
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.2
  vim.o.guifont = 'JetBrainsMono Nerd Font Mono:h14'
end

vim.g.have_nerd_font = true

vim.cmd 'language en_US.UTF-8'

vim.filetype.add { extension = { wgsl = 'wgsl' } }

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.breakindent = true

vim.o.undofile = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
vim.o.list = true
vim.opt.listchars = { tab = '» ', space = '·', trail = '·', nbsp = '␣' }

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.confirm = true

-- fix endofline for things rely on file hash
vim.o.endofline = false
vim.o.fixendofline = false

-- soft line wrap
vim.o.wrap = true

-- line length indicator
vim.o.colorcolumn = '74,100'

-- color
vim.o.termguicolors = true

-- spell
vim.o.spell = true
vim.opt.spelllang = { 'en_us', 'cjk' }

-- auto change working dir to current open file's parent dir
-- vim.o.autochdir = true

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  virtual_text = false,
  virtual_lines = true,

  -- jump = {
  --   on_jump = function(_, bufnr)
  --     vim.diagnostic.open_float {
  --       bufnr = bufnr,
  --       scope = 'cursor',
  --       focus = false,
  --     }
  --   end,
  -- },
}

require 'golden_water.keymap'
require 'golden_water.autocmd'
-- require 'golden_water.lazy'
require 'golden_water.highlights'
require 'golden_water.plugins'
