-- colorscheme

return {
  "navarasu/onedark.nvim",
  priority = 1000,
  config = function()
    require("onedark").setup({
      -- Main options --
      style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      transparent = false, -- Show/hide background
      term_colors = true, -- Change terminal color as per the selected theme style
      ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

      -- Change code style ---
      -- Options are italic, bold, underline, none
      -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      code_style = {
        comments = "italic",
        keywords = "none",
        functions = "none",
        strings = "none",
        variables = "none",
      },
    })
    require("onedark").load()
  end,
}
