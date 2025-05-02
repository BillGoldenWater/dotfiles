-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank { timeout = 1000 }
  end,
})

vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  desc = 'Set filetype for glsl(.vert, .tesc, .tese, .geom, .frag, .comp)',
  pattern = {
    '*.vert',
    '*.tesc',
    '*.tese',
    '*.geom',
    '*.frag',
    '*.comp',
  },

  group = vim.api.nvim_create_augroup('goldenwater-glsl-filetype', { clear = true }),
  callback = function()
    vim.bo.filetype = 'glsl'
  end,
})
