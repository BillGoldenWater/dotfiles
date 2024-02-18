-- region neovim
local set = vim.opt

set.shiftwidth = 2
set.expandtab = true
set.autoindent = true
set.smartindent = true

set.endofline = false
set.fixendofline = false

set.relativenumber = true
set.number = true

set.autochdir = true

vim.cmd[[color habamax]]

if vim.g.neovide then
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.2
end
-- endregion

-- region lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
set.rtp:prepend(lazypath)

require("lazy").setup({
  "wakatime/vim-wakatime",

  "ThePrimeagen/vim-be-good",

  "nanotee/zoxide.vim",
  "junegunn/fzf",

  "williamboman/mason.nvim",

  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^4",
  --   ft = { "rust" },
  -- },
  
  {
    "neoclide/coc.nvim",
    branch = "master",
    build = "npm ci"
  },

  -- "nvim-treesitter/nvim-treesitter",
})
-- endregion

-- region coc.nvim
vim.g.coc_global_extensions = {
  "coc-sh",

  "coc-rust-analyzer",
  "coc-lua",
  "coc-tsserver",
  "coc-sql",
  "@yaegassy/coc-pylsp",

  "coc-toml",
  "coc-json",

  "coc-spell-checker",
}
require("coc_init")
-- endregion

-- region mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})

-- require("mason-lspconfig").setup()
-- 
-- local rust_tools = require("rust-tools")
-- rust_tools.setup({
--   server = {
--     on_attach = function(_, bufnr)
--       vim.keymap.set("n", "<C-space>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
--       vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--     end,
--   },
-- })
-- endregion

-- region treesitter
-- require('nvim-treesitter.configs').setup {
--   ensure_installed = { "lua", "rust", "toml" },
--   auto_install = true,
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting=false,
--   },
--   ident = { enable = true }, 
--   rainbow = {
--     enable = true,
--     extended_mode = true,
--     max_file_lines = nil,
--   }
-- }
-- endregion
