-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config
local act = wezterm.action

if wezterm.config_builder then
  config = wezterm.config_builder()
else
  config = {}
end

config.color_scheme = 'Catppuccin Frappe'
config.default_prog = { '/usr/local/bin/nu', '-l' }
config.font = wezterm.font_with_fallback({
  { family = 'VictorMono Nerd Font Mono', weight = 500, italic = false, scale = 1.15 },
  'JetBrains Mono'
})


config.hide_tab_bar_if_only_one_tab = true
config.switch_to_last_active_tab_when_closing_tab = true
config.use_fancy_tab_bar = false

config.set_environment_variables = {
  PATH = '/usr/local/bin:' .. os.getenv('PATH'),
  EDITOR = '/Users/anton_ratnikov/.local/share/bob/nvim-bin/nvim',
  SUDO_EDITOR = '/Users/anton_ratnikov/.local/share/bob/nvim-bin/nvim'
}

config.window_frame = {
  border_left_width = 0,
  border_right_width = 0,
  border_bottom_height = 0,
  border_top_height = 0,
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.keys = {
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
  {
    key = 'g',
    mods = 'CTRL|SHIFT',
    action = wezterm.action_callback(function(win, pane)
      local mux_win = win:mux_window()
      local tab = mux_win:spawn_tab { args = { 'lazygit' }, cwd = pane:get_current_working_dir() }
      tab:set_title('Lazygit ' + pane:get_current_working_dir())
    end)
  },
  {
    key = 'm',
    mods = 'CTRL',
    action = act.ActivateKeyTable {
      name = 'm_space',
      one_shot = true,
    },
  }
}

config.key_tables = {
  m_space = {
    {
      key = 't',
      action = act.SendKey {
        key = 'Escape',
      },
    },
    {
      key = 't',
      mods = 'CTRL',
      action = act.SendKey {
        key = 'Escape',
      },
    },
    {
      key = 'n',
      action = act.Multiple {
        act.SendKey { key = '\\', mods = 'CTRL' },
        act.SendKey { key = 'n', mods = 'CTRL' },
      },
    },
    {
      key = 'n',
      mods = 'CTRL',
      action = act.Multiple {
        act.SendKey { key = '\\', mods = 'CTRL' },
        act.SendKey { key = 'n', mods = 'CTRL' },
      },
    },
  },
}


return config
