require 'golden_water.keymap'
require 'golden_water.autocmd'
require 'golden_water.lazy'

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

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)

-- indent
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- search/replace
vim.o.hlsearch = true
vim.o.incsearch = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
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

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
-- vim.o.confirm = true

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
