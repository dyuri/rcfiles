-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

-- wayland
config.enable_wayland = false -- TODO

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- word boundary
config.selection_word_boundary = ' {}[]()"\'`,;:|│'

-- style
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
config.color_scheme = 'GruvboxDarkHard'
config.colors = {
  foreground = '#ebdbb2',
  background = '#282828',
  cursor_bg = '#ebdbb2',
  cursor_border = '#ebdbb2',
  cursor_fg = '#282828',
}
config.window_background_opacity = 0.8
config.font = wezterm.font_with_fallback {
  {
    family = 'Monaspace Neon',
    weight = 200,
    harfbuzz_features = {
      'ss01=1',
      'ss02=1',
      'ss03=1',
      'ss04=1',
      'ss05=1',
      'ss06=1',
      'ss07=1',
      'ss08=1',
      'calt=1',
      'dlig=1',
    },
  },
  'Hasklug Nerd Font',
  'FuraCode Nerd Font',
  'Noto Color Emoji'
}
config.font_size = 11.0
config.freetype_load_target = 'HorizontalLcd'
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}
config.xcursor_theme = 'Adwaita'

-- disable the tab bar
config.enable_tab_bar = false

-- mouse bindings
config.mouse_bindings = {
  -- selection with SHIFT should act like w/o SHIFT
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = act.SelectTextAtMouseCursor "Cell",
  },
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = act.ExtendSelectionToMouseCursor "Cell",
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = act.CompleteSelection "ClipboardAndPrimarySelection",
  },
  {
    event = { Down = { streak = 2, button = 'Left' } },
    mods = 'SHIFT',
    action = act.SelectTextAtMouseCursor "Word",
  },
  {
    event = { Up = { streak = 2, button = 'Left' } },
    mods = 'SHIFT',
    action = act.CompleteSelection "ClipboardAndPrimarySelection",
  },
  {
    event = { Down = { streak = 3, button = 'Left' } },
    mods = 'SHIFT',
    action = act.SelectTextAtMouseCursor "Line",
  },
  {
    event = { Up = { streak = 3, button = 'Left' } },
    mods = 'SHIFT',
    action = act.CompleteSelection "ClipboardAndPrimarySelection",
  },
  {
    event = { Down = { streak = 1, button = 'Middle' } },
    mods = 'SHIFT',
    action = act.PasteFrom "PrimarySelection",
  },
  -- Scrolling up while holding CTRL increases the font size
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'CTRL',
    action = act.IncreaseFontSize,
  },

  -- Scrolling down while holding CTRL decreases the font size
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'CTRL',
    action = act.DecreaseFontSize,
  },
}

-- and finally, return the configuration to wezterm
return config
