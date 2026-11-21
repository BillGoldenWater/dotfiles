vim.pack.add { 'https://github.com/mfussenegger/nvim-lint' }

local lint = require 'lint'
lint.linters_by_ft = {
  markdown = { 'markdownlint' },
}

local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
  group = lint_augroup,
  callback = function()
    -- Only lint on markdown file that has been saved
    if vim.bo.filetype == 'markdown' and vim.fn.filereadable(vim.fn.bufname '%') == 0 then
      return
    end
    if vim.bo.modifiable then
      lint.try_lint()
    end
  end,
})
