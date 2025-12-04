-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank { timeout = 1000 }
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

local group_binary = vim.api.nvim_create_augroup('goldenwater-binary', { clear = true })
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  group = group_binary,
  callback = function()
    if vim.bo.binary then
      vim.fn.execute '%!xxd -c 16'
      vim.bo.filetype = 'xxd'
      vim.fn.execute 'redraw'
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = group_binary,
  callback = function()
    if vim.bo.binary then
      if vim.bo.filetype == 'xxd' then
        vim.b.__gw_binary__ = vim.fn.winsaveview()
        vim.fn.execute '%!xxd -r -c 16'
      end
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  group = group_binary,
  callback = function()
    if vim.bo.binary then
      if vim.bo.filetype == 'xxd' then
        vim.fn.execute '%!xxd -c 16'
        vim.bo.modified = false
        vim.fn.winrestview(vim.b.__gw_binary__)
        vim.b.__gw_binary__ = nil
        vim.fn.execute 'redraw'
      end
    end
  end,
})
