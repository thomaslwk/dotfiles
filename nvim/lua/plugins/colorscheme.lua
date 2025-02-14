-- colorscheme

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    require("tokyonight").setup({
      style = "day",
      transparent = false,
      styles = {
        functions = { bold = true },
      },
      sidebars = "normal",
    }),
  },
}
