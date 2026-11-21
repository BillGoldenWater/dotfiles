local gh = require('golden_water.utils').gh

-- lsp notification/progress at bottom right
vim.pack.add { gh 'j-hui/fidget.nvim' }
require('fidget').setup {}

-- wesl
vim.filetype.add {
  extension = {
    wesl = 'wesl',
  },
}
vim.treesitter.language.register('wgsl', 'wesl')

vim.pack.add {
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  gh 'mason-org/mason-lspconfig.nvim',
}

require('mason').setup {}
require('mason-lspconfig').setup {
  ensure_installed = {},
  automatic_installation = false,
}

local servers = {
  clangd = nil,
  gopls = nil,
  pyright = nil,
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        -- cargo = {
        --   targetDir = true,
        -- },
        check = {
          command = 'clippy',
        },
      },
    },
  },
  marksman = nil,
  -- toml
  taplo = nil,
  emmet_language_server = nil,
  -- js/ts
  ts_ls = nil,
  -- biome = nil,
  denols = nil,
  -- css
  cssls = nil,
  tailwindcss = nil,
  -- json
  jsonls = nil,
  wgsl_analyzer = {
    filetypes = { 'wgsl', 'wesl' },
    root_makers = { 'wesl.toml', '.git' },
    single_file_support = true,
  },
  kotlin_language_server = nil,
  ocamllsp = nil,
  -- java
  jdtls = nil,
  -- zig
  zls = nil,
  glslls = {
    cmd = { 'glslls', '--stdin', '--target-env', 'opengl' },
  },
  lua_ls = {
    on_init = function(client)
      -- Disable formatting (formatting is done by stylua)
      client.server_capabilities.documentFormattingProvider = false

      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        local not_nvim_cfg = path ~= vim.fn.stdpath 'config'
        local lua_workspace = (
          vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')
        )
        if not_nvim_cfg and lua_workspace then
          return
        end
      end

      local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
      client.config.settings.Lua = vim.tbl_deep_extend('force', current_settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
          --  See https://github.com/neovim/nvim-lspconfig/issues/3189
          library = vim.api.nvim_get_runtime_file('', true),
        },
      })
    end,
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        -- Disable formatting (formatting is done by stylua)
        format = { enable = false },
      },
    },
  },
  dotls = nil,
}
if vim.fn.executable 'nu' == 1 then
  vim.lsp.enable 'nushell'
end
vim.lsp.enable 'gdscript'

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
})

for s, cfg in pairs(servers) do
  if cfg ~= nil then
    vim.lsp.config(s, cfg)
  end
end

-- prompt for LSPs that is exists in servers but not installed
-- required servers of file type
local installed_servers = {}
local package_to_lspconfig = require('mason-lspconfig').get_mappings().package_to_lspconfig
for _, tool in ipairs(require('mason-registry').get_installed_package_names()) do
  local tool_name = package_to_lspconfig[tool] or tool
  installed_servers[tool_name] = true
end

local required_servers = {
  lua = { stylua = true },
  javascript = { prettier = true },
  typescript = { prettier = true },
}
for server_name in pairs(servers) do
  local filetypes = vim.lsp.config[server_name].filetypes

  for _, filetype in ipairs(filetypes or {}) do
    if required_servers[filetype] == nil then
      required_servers[filetype] = {}
    end

    required_servers[filetype][server_name] = true
  end
end

-- missing servers of file type
local missing_servers_msg = {}
for ft, server_names in pairs(required_servers) do
  local missing_servers = {}
  for server in pairs(server_names) do
    if installed_servers[server] == nil then
      table.insert(missing_servers, server)
    end
  end
  if #missing_servers > 0 then
    missing_servers_msg[ft] = table.concat(missing_servers, ', ')
  end
end

vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Prompt for LSPs that is exists in servers but not installed',

  group = vim.api.nvim_create_augroup('goldenwater-lsp-prompt-install', { clear = true }),
  callback = function()
    if vim.bo.buftype ~= '' then
      return
    end

    local msg = missing_servers_msg[vim.bo.filetype]
    if msg == nil then
      return
    end

    msg = 'Configured servers that are missing for this file type: ' .. msg
    -- schedule for avoid override when startup
    vim.schedule(function()
      vim.api.nvim_echo({ { msg } }, true, {})
    end)
  end,
})

-- lsp attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup =
        vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map('<leader>cht', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[C]ode Inlay [H]ints [T]oggle')
      map('<leader>chr', function()
        vim.lsp.inlay_hint.enable(false)
        vim.lsp.inlay_hint.enable(true)
      end, '[C]ode Inlay [H]ints [R]eopen')

      vim.lsp.inlay_hint.enable(true)
    end
  end,
})
