vim.pack.add { 'https://github.com/stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    if vim.g.disable_autoformat then
      return nil
    end

    local disable_filetypes = { c = true, cpp = true }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 3000,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
    html = { 'prettierd', 'prettier', stop_after_first = true },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    rust = { 'rustfmt' },
    css = { 'prettierd', 'prettier', stop_after_first = true },
    scss = { 'prettierd', 'prettier', stop_after_first = true },
    ocaml = { 'ocamlformat' },
  },
  formatters = {
    rustfmt = {
      prepend_args = function()
        return { '+nightly' }
      end,
    },
  },
}

vim.keymap.set('n', '<leader>fb', function()
  require('conform').format { async = true, lsp_format = 'fallback' }
end, { desc = '[F]ormat [b]uffer' })

vim.keymap.set('n', '<leader>fd', function()
  vim.g.disable_autoformat = true
end, { desc = '[F]ormat [d]isable' })
vim.keymap.set('n', '<leader>fe', function()
  vim.g.disable_autoformat = false
end, { desc = '[F]ormat [e]nable' })
