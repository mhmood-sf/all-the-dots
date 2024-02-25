local wt = require "wezterm"
local act = wt.action

local cfg = {
    check_for_updates = false,

    cursor_blink_rate = 0,

    text_blink_rate = 0,

    color_scheme = "lazyfox",

    font = wt.font("Cascadia Code PL"),
    font_size = 10.5,

    hide_tab_bar_if_only_one_tab = true,

    xcursor_theme = "Adwaita",

    keys = {
        {
            key = "LeftArrow",
            mods = "ALT|SHIFT",
            action = act.ActivatePaneDirection "Left",
        },
        {
            key = "RightArrow",
            mods = "ALT|SHIFT",
            action = act.ActivatePaneDirection "Right",
        },
        {
            key = "UpArrow",
            mods = "ALT|SHIFT",
            action = act.ActivatePaneDirection "Up",
        },
        {
            key = "DownArrow",
            mods = "ALT|SHIFT",
            action = act.ActivatePaneDirection "Down",
        },
        {
            key = "W",
            mods = "CTRL",
            action = act.CloseCurrentPane { confirm = true }
        },
        {
            key = "V",
            mods = "ALT",
            action = act.SplitVertical
        },
        {
            key = "H",
            mods = "ALT",
            action = act.SplitHorizontal
        },
        {
            key = "V",
            mods = "CTRL",
            action = act.PasteFrom "Clipboard"
        },
    }
}

return cfg
