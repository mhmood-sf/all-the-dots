local colors = require(vim.g.colors_name).colors
local lc = require("linecook")
local lc_utils = require("linecook.utils")
local builtin = {
    containers = require("linecook.containers"),
    components = require("linecook.components")
}

local purple_bubble = builtin.containers.bubble("purple_bubble", {
    fg = colors.shade0,
    bg = colors.accent7,
    gui = "bold"
})

local black_bubble = builtin.containers.bubble("black_bubble", {
    fg = "bg",
    bg = "fg",
    gui = "italic,bold"
})

local pink_bubble = builtin.containers.bubble("pink_bubble", {
    fg = colors.shade0,
    bg = colors.accent6
})

local inactive_bubble = builtin.containers.bubble("inactive_bubble", {
    fg = colors.shade0,
    bg = colors.shade3
})

local lighter_fg = builtin.containers.plain("lighter_fg", {
    fg = colors.shade4
})

local mode = function(stl)
    -- Only show the mode on the active statusline.
    if stl.active then
        return purple_bubble(lc_utils.get_mode())
    else
        return inactive_bubble("INACTIVE")
    end
end

local modified = function(stl)
    local modified = vim.api.nvim_get_option_value("modified", {
        buf = stl.bufnr
    })
    return modified and "[•] " or ""
end

local filename = function(stl)
    return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(stl.bufnr), ":t")
end

local filetype = function(stl)
    local bubble = stl.active and pink_bubble or inactive_bubble
    local ft = vim.api.nvim_get_option_value("filetype", { buf = stl.bufnr })
    return bubble(ft)
end

local position = function(stl)
    local pos = lc_utils.get_pos_info(stl)
    return lighter_fg(string.format("%s:%s / %s", pos.l, pos.c, pos.t))
end

local render = lc.mk_renderer {
    mode,
    builtin.components.spacing(2),
    modified,
    filename,
    builtin.components.divider,
    position,
    builtin.components.spacing(2),
    filetype
}

vim.o.stl = "%!v:lua.require'config.statusline'.render()"

return { render = render }
