local colors = require(vim.g.colors_name).colors
local lc = require("linecook")
local lc_utils = require("linecook.utils")
local builtin = {
    containers = require("linecook.containers"),
    components = require("linecook.components")
}

local purple_bubble = builtin.containers.bubble("purple_bubble", {
    fg = colors.shade0,
    bg = colors.accent7
})

local pink_bubble = builtin.containers.bubble("pink_bubble", {
    fg = colors.shade0,
    bg = colors.accent6
})

local mode = function()
    return purple_bubble(lc_utils.get_mode())
end

local filename = function()
    return vim.fn.expand("%:t")
end

local filetype = function()
    return pink_bubble(vim.bo.filetype)
end

local position = function()
    local pos = lc_utils.get_pos_info()
    return string.format("%s:%s / %s", pos.l, pos.c, pos.t)
end

local render = lc.mk_renderer {
    mode,
    builtin.components.spacing(2),
    filename,
    builtin.components.divider,
    position,
    builtin.components.spacing(2),
    filetype
}

vim.o.stl = "%!v:lua.require'config.statusline'.render()"

return { render = render }
