require 'golden_water.keymap'
require 'golden_water.autocmd'
require 'golden_water.lazy'

-- neovide
if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.2
  vim.opt.guifont = 'JetBrainsMono Nerd Font Mono:h14'
end

vim.cmd 'language en_US.UTF-8'

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.opt.clipboard = 'unnamedplus'

-- indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- search/replace
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- fix endofline for things rely on file hash
vim.opt.endofline = false
vim.opt.fixendofline = false

-- soft line wrap
vim.opt.wrap = true

-- line length indicator
vim.opt.colorcolumn = '100'

-- color
vim.opt.termguicolors = true

-- spell
vim.opt.spell = true
vim.opt.spelllang = 'en_us'

-- auto change working dir to current open file's parent dir
-- vim.opt.autochdir = true
