return {
  -- {
  --   'dracula/vim',
  --   name = 'dracula',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- Load the colorscheme here
  --     vim.cmd.colorscheme 'dracula'
  --
  --     -- You can configure highlights by doing something like
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('tokyonight').setup {
        -- transparent = true,
        on_colors = function(colors)
          local Util = require 'tokyonight.util'
          local opts = require('tokyonight.config').defaults
          opts.style = 'night'
          local styles = require('tokyonight.colors').styles

          Util.day_brightness = opts.day_brightness

          local palette = styles[opts.style]
          if type(palette) == 'function' then
            palette = palette(opts) --[[@as Palette]]
          end

          -- custom here
          palette = vim.tbl_deep_extend('force', palette, {
            bg = '#1c1c1c',
            bg_dark = '#171717',
            bg_highlight = '#2f2f2f',
            comment = '#626262',
            dark3 = '#5e5e5e',
            dark5 = '#7d7d7d',
            fg = '#cccccc',
            fg_dark = '#b3b3b3',
            fg_gutter = '#444444',
            terminal_black = '#4a4a4a',

            -- blue = '#7aa2f7',
            -- blue0 = '#3d59a1',
            -- blue1 = '#2ac3de',
            -- blue2 = '#0db9d7',
            -- blue5 = '#89ddff',
            -- blue6 = '#b4f9f8',
            -- blue7 = '#394b70',
            -- cyan = '#7dcfff',
            -- green = '#9ece6a',
            -- green1 = '#73daca',
            -- green2 = '#41a6b5',
            -- magenta = '#bb9af7',
            -- magenta2 = '#ff007c',
            -- orange = '#ff9e64',
            -- purple = '#9d7cd8',
            -- red = '#f7768e',
            -- red1 = '#db4b4b',
            -- teal = '#1abc9c',
            -- yellow = '#e0af68',
            -- git = {
            --   add = '#449dab',
            --   change = '#6183bb',
            --   delete = '#914c54',
            -- },
          })
          -- end

          for key, value in pairs(palette) do
            colors[key] = value
          end

          Util.bg = colors.bg
          Util.fg = colors.fg

          colors.none = 'NONE'

          colors.diff = {
            add = Util.blend_bg(colors.green2, 0.15),
            delete = Util.blend_bg(colors.red1, 0.15),
            change = Util.blend_bg(colors.blue7, 0.15),
            text = colors.blue7,
          }

          colors.git.ignore = colors.dark3
          colors.black = Util.blend_bg(colors.bg, 0.8, '#000000')
          colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
          colors.border = colors.black

          -- Popups and statusline always get a dark background
          colors.bg_popup = colors.bg_dark
          colors.bg_statusline = colors.bg_dark

          -- Sidebar and Floats are configurable
          colors.bg_sidebar = opts.styles.sidebars == 'transparent' and colors.none or opts.styles.sidebars == 'dark' and colors.bg_dark or colors.bg

          colors.bg_float = opts.styles.floats == 'transparent' and colors.none or opts.styles.floats == 'dark' and colors.bg_dark or colors.bg

          colors.bg_visual = Util.blend_bg(colors.blue0, 0.4)
          colors.bg_search = colors.blue0
          colors.fg_sidebar = colors.fg_dark
          colors.fg_float = colors.fg

          colors.error = colors.red1
          colors.todo = colors.blue
          colors.warning = colors.yellow
          colors.info = colors.blue2
          colors.hint = colors.teal

          colors.rainbow = {
            colors.blue,
            colors.yellow,
            colors.green,
            colors.teal,
            colors.magenta,
            colors.purple,
            colors.orange,
            colors.red,
          }

          -- stylua: ignore
          --- @class TerminalColors
          colors.terminal = {
            black          = colors.black,
            black_bright   = colors.terminal_black,
            red            = colors.red,
            red_bright     = Util.brighten(colors.red),
            green          = colors.green,
            green_bright   = Util.brighten(colors.green),
            yellow         = colors.yellow,
            yellow_bright  = Util.brighten(colors.yellow),
            blue           = colors.blue,
            blue_bright    = Util.brighten(colors.blue),
            magenta        = colors.magenta,
            magenta_bright = Util.brighten(colors.magenta),
            cyan           = colors.cyan,
            cyan_bright    = Util.brighten(colors.cyan),
            white          = colors.fg_dark,
            white_bright   = colors.fg,
          }
        end,
      }

      -- Load the colorscheme here
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
