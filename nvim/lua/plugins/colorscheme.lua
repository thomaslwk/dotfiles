-- colorscheme

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     require("tokyonight").setup({
--       style = "night",
--       styles = {
--         transparent = false,
--         functions = { bold = true },
--       },
--       sidebars = "normal",
--     }),
--   },
-- }
