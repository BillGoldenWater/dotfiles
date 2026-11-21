vim.pack.add { 'https://github.com/folke/snacks.nvim' }
if Snacks == nil then
  require('snacks').setup {
    indent = {
      animate = { enabled = false },
    },
    picker = { ui_select = true },
  }
end

Snacks.indent.enable()

local map = require('golden_water.utils').map

map('<leader>sh', Snacks.picker.help, 'Help')
map('<leader>sk', Snacks.picker.keymaps, 'Keymaps')
map('<leader>sf', Snacks.picker.files, 'Keymaps')
map('<leader>sp', Snacks.picker.pickers, 'Pickers')
map('<leader>sw', Snacks.picker.grep_word, 'Current word/select', { 'n', 'x' })
map('<leader>sg', Snacks.picker.grep, 'Grep')
map('<leader>sd', Snacks.picker.diagnostics, 'Diagnostics')
map('<leader>sr', Snacks.picker.resume, 'Resume')
map('<leader>s.', Snacks.picker.recent, 'Recent')
map('<leader>sb', Snacks.picker.buffers, 'Buffers')
map('<leader>sl', Snacks.picker.lines, 'Lines in current buffer')

map('grr', Snacks.picker.lsp_references, 'References')
map('gri', Snacks.picker.lsp_implementations, 'Implementations')
map('grd', Snacks.picker.lsp_definitions, 'Definitions')
map('grt', Snacks.picker.lsp_type_definitions, 'Type definitions')
map('grc', Snacks.picker.lsp_incoming_calls, 'Callers')
map('grC', Snacks.picker.lsp_outgoing_calls, 'Callees')
map('<leader>ss', Snacks.picker.lsp_symbols, 'Symbols')
map('<leader>sS', Snacks.picker.lsp_workspace_symbols, 'Workspace symbols')

map('<leader>sa', function()
  Snacks.picker.files {
    hidden = true,
    ignored = true,
  }
end, 'All files')

map('<leader>sn', function()
  Snacks.picker.files {
    dirs = { vim.fn.stdpath 'config' },
  }
end, 'Lines in current buffer')
