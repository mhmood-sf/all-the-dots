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

    window_decorations = "RESIZE",

    keys = {
        {
            key = "LeftArrow",
            mods = "ALT",
            action = act.ActivatePaneDirection "Left",
        },
        {
            key = "RightArrow",
            mods = "ALT",
            action = act.ActivatePaneDirection "Right",
        },
        {
            key = "UpArrow",
            mods = "ALT",
            action = act.ActivatePaneDirection "Up",
        },
        {
            key = "DownArrow",
            mods = "ALT",
            action = act.ActivatePaneDirection "Down",
        },
        {
            key = "d",
            mods = "ALT",
            action = act.SplitVertical
        },
        {
            key = "r",
            mods = "ALT",
            action = act.SplitHorizontal
        },
        {
            key = "h",
            mods = "ALT",
            action = act.AdjustPaneSize { "Left", 5 },
        },
        {
            key = "j",
            mods = "ALT",
            action = act.AdjustPaneSize { "Down", 5 },
        },
        {
            key = "k",
            mods = "ALT",
            action = act.AdjustPaneSize { "Up", 5 }
        },
        {
            key = "l",
            mods = "ALT",
            action = act.AdjustPaneSize { "Right", 5 },
        },
        {
            key = "V",
            mods = "CTRL",
            action = act.PasteFrom "Clipboard"
        },
    }
}

return cfg
