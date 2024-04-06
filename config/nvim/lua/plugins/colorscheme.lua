return {
  "ribru17/bamboo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("bamboo").setup({
      -- optional configuration here
      -- NOTE: to use the light theme, set `vim.o.background = 'light'`
      style = "vulgaris", -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
      toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
      toggle_style_list = { "vulgaris", "multiplex", "light" }, -- List of styles to toggle between
      transparent = false, -- Show/hide background
      dim_inactive = false, -- Dim inactive windows/buffers
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- Change code style ---
      -- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
      -- You can also configure styles with a string, e.g. keywords = 'italic,bold'
      code_style = {
        comments = { italic = true },
        conditionals = { italic = true },
        keywords = {},
        functions = {},
        namespaces = { italic = true },
        parameters = { italic = true },
        strings = {},
        variables = {},
      },

      -- Lualine options --
      lualine = {
        transparent = false, -- lualine center bar transparency
      },

      -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },

      --       -- Custom Highlights --
      --       colors = {
      --         -- bright_orange = "#ff8800", -- define a new color
      --         -- green = "#00ffaa", -- redefine an existing color
      --       },
      --
      highlights = {
        -- make comments blend nicely with background, similar to other color schemes
        ["@comment"] = { fg = "$grey" },

        -- ["@keyword"] = { fg = "$green" },
        -- ["@string"] = { fg = "$bright_orange", bg = "#00ff00", fmt = "bold" },
        -- ["@function"] = { fg = "#0000ff", sp = "$cyan", fmt = "underline,italic" },
        -- ["@function.builtin"] = { fg = "#0059ff" },
      },
    })
    require("bamboo").load()
  end,
}
-- return {
--   "craftzdog/solarized-osaka.nvim", -- Solarized colorscheme
--   lazy = true, -- Will load the colorscheme on-demand later via `require('solarized-osaka').colorscheme()`
--   priority = 1000, -- Load the colorscheme after loading all plugins
--   opts = function()
--     return {
--       transparent = true, -- Enable the transparent background
--     }
--   end,
-- }
--
