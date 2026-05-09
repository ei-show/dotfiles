local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font_size = 14
config.color_scheme = "Tokyo Night"
config.window_background_opacity = 0.95
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_ime = true

return config