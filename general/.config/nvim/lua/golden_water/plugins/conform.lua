return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>fb',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat [b]uffer',
      },
      {
        '<leader>fdg',
        function()
          vim.g.disable_autoformat = true
        end,
        mode = '',
        desc = '[F]ormat disable globally',
      },
      {
        '<leader>fdb',
        function()
          vim.b.disable_autoformat = true
        end,
        mode = '',
        desc = '[F]ormat disable current buffer',
      },
      {
        '<leader>fe',
        function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end,
        mode = '',
        desc = '[F]ormat enable',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return nil
        end

        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
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
    },
  },
}
