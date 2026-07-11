return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      local treesitter = require 'nvim-treesitter'
      treesitter.install { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' }

      local function try_install(ft) end

      vim.api.nvim_create_autocmd('FileType', {
        callback = function()
          local function do_init(buf)
            vim.treesitter.start(buf)

            -- folds, provided by Neovim
            -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            -- vim.wo.foldmethod = 'expr'
            -- indentation, provided by nvim-treesitter
            -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end

          -- local install = async.wrap()

          local ft = vim.bo.filetype
          local buf = vim.api.nvim_get_current_buf()

          local installed = vim.list_contains(treesitter.get_installed(), ft)
          if installed then
            do_init(buf)
            return
          end

          local available = vim.list_contains(treesitter.get_available(), ft)
          if not available then
            return
          end

          local task = treesitter.install { ft }
          table.insert(task._callbacks, function()
            if vim.list_contains(vim.api.nvim_list_bufs(), buf) then
              do_init(buf)
            end
          end)
        end,
      })
    end,
    -- -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- opts = {
    --   -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    --   ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline' },
    --   auto_install = true,
    --   highlight = {
    --     enable = true,
    --
    --     -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    --     disable = function(_, buf)
    --       local max_filesize = 1 * 1024 * 1024 -- 1 MiB
    --       local ok, stats = pcall((vim.uv or vim.loop).fs_stat, vim.api.nvim_buf_get_name(buf))
    --       if ok and stats and stats.size > max_filesize then
    --         return true
    --       end
    --     end,
    --
    --     -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    --     -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    --     -- Using this option may slow down your editor, and you may see some duplicate highlights.
    --     -- Instead of true it can also be a list of languages
    --     additional_vim_regex_highlighting = { 'ruby' },
    --   },
    --   indent = { enable = true, disable = { 'ruby' } },
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       init_selection = 'gnn',
    --       node_incremental = 'grn',
    --       scope_incremental = 'grc',
    --       node_decremental = 'grm',
    --     },
    --   },
    -- },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
