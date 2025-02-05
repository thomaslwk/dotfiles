-- colorscheme

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    require("tokyonight").setup({
      style = "storm",
      transparent = false,
      styles = {
        functions = { bold = true },
      },
      sidebars = "normal",
    }),
  },
}
