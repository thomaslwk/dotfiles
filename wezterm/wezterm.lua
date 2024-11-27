-- Pull in the wezterm API
local wezterm = require 'wezterm'

local config = {}
-- WSL Config 
config.wsl_domains = {
  {
    name = 'WSL:Ubuntu',
    distribution = 'Ubuntu',
    default_cwd = '~'
  },
}
config.default_domain = 'WSL:Ubuntu'
config.color_scheme = 'Ocean (dark) (terminal.sexy)'

--------------
-- CONFIG
--------------
config.default_cursor_style = "SteadyBlock"

-- Set the terminal type- This table will hold the configuration.
config.term = "xterm-256color"
config.cell_width = 0.9
config.line_height = 1.6
config.font = wezterm.font 'FantasqueSansM Nerd Font'

--------------
-- tabs
--------------
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

--------------
-- Style
--------------
config.window_background_opacity = 0.80
config.font_size = 12
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "NONE | RESIZE"
config.initial_cols = 80

-- and finally, return the configuration to wezterm
return config
