-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_cursor_style = "SteadyBlock"
config.term = "xterm-256color" -- Set the terminal type

config.default_domain = 'WSL:Ubuntu-24.04'
config.font = wezterm.font 'JetBrainsMono Nerd Font'

-- For example, changing the color scheme:
config.color_scheme = 'tokyonight-storm'

-- config.cell_width = 0.9
config.line_height = 1.7
config.window_background_opacity = 0.9
config.prefer_egl = true
config.font_size = 11.0

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.window_decorations = "NONE | RESIZE"

-- and finally, return the configuration to wezterm
return config
