vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  columns = { 'icon' },
  keymaps = {
    ['<C-h>'] = false,
    ['<C-l>'] = false,
    ['<C-k>'] = false,
    ['<C-j>'] = false,
    ['~'] = { 'actions.cd', opts = { scope = 'win' }, mode = 'n' },
  },
  view_options = {
    show_hidden = true,
  },
}

-- Open parent directory in current window
vim.keymap.set('n', '<leader>pv', '<cmd>Oil<cr>', { desc = 'Open parent directory with oil' })
