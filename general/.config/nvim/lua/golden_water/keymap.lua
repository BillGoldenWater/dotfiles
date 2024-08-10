-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
--  WARN: Put all other keymap after this
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- jump half page
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'jump half page down and then center' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'jump half page up and then center' })

-- search
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'next item, center, unfold to cursor' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'previous item, center, unfold to cursor' })

-- buffers
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>', { desc = '[B]uffer [Q]uit(delete) (unload)' })
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<cr>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = '[B]uffer [P]revious' })
vim.keymap.set('n', '<leader>bl', '<cmd>buffers<cr>', { desc = '[B]uffer [L]ist' })

-- tabs
vim.keymap.set('n', '<leader>tc', '<cmd>tabnew<cr>', { desc = '[T]ab [C]reate (new)' })
vim.keymap.set('n', '<leader>tq', '<cmd>tabclose<cr>', { desc = '[T]ab [Q]uit (close)' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabnext<cr>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabprevious<cr>', { desc = '[T]ab [P]revious' })

-- replace current selection without overwrite " register
vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'replace current selection' })

-- netrw
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'open netrw' })

-- move selected region
vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv", { desc = 'move selected text down' })
vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv", { desc = 'move selected text up' })

-- copy to clipboard
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'copy to clipboard' })
