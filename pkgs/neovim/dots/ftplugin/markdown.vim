setlocal tw=0      " Don't automatically insert new lines for long lines
setlocal nospell   " Gets annoying
setlocal wrap      " Wrap long lines
setlocal linebreak " Wrap long lines at sane points

lua << EOF

local hi = require(vim.g.colors_name).hi
local colors = require(vim.g.colors_name).colors

-- Markup Syntax
hi("@markup.heading",    { fg = colors.accent0 })
hi("@markup.heading.1",  { fg = colors.accent0 })
hi("@markup.heading.2",  { fg = colors.accent7 })
hi("@markup.heading.3",  { fg = colors.accent6 })
hi("@markup.heading.4",  { fg = colors.accent5 })
hi("@markup.heading.5",  { fg = colors.accent4 })
hi("@markup.heading.6",  { fg = colors.accent3 })
hi("@markup.quote",      { fg = colors.shade5, gui = "italic" })
hi("@markup.list",       { fg = colors.accent3 })
hi("@markup.link",       { fg = colors.accent5 })
hi("@markup.link.label", { fg = colors.accent3 })
hi("@tag",               { fg = colors.accent5 })
hi("@tag.delimiter",     { fg = colors.accent0 })
EOF
