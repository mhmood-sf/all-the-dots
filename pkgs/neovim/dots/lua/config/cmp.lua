local cmp = require("cmp")

local win_config = cmp.config.window.bordered()
win_config.border = "solid"
win_config.winhighlight = "FloatBorder:FloatBorder,CursorLine:Visual,Search:None"

cmp.setup {
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
    window = {
        completion = win_config,
        documentation = win_config,
    },

    sources = {
        {
            name = "nvim_lsp"
        },
        {
            name = "buffer"
        }
    },

    mapping = {
        -- Enter to select completion.
        ["<CR>"] = function(fallback)
            -- Fallback if no entry is selected!
            if cmp.visible() and cmp.get_selected_entry() then
                cmp.confirm()
            else
                fallback()
            end
        end,

        -- Tab to cycle forward.
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.snippet.active({ direction = 1 }) then
                vim.snippet.jump(1)
            else
                fallback()
            end
        end,

        -- Shift+Tab to cycle backward.
        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.snippet.active({ direction = -1 }) then
                vim.snippet.jump(-1)
            else
                fallback()
            end
        end
    },

    view = {
        docs = { auto_open = true }
    }
}
