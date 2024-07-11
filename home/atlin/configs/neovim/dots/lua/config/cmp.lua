local cmp = require("cmp")

cmp.setup {
--[[
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end
    },
--]]
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" }
    },

    mapping = {
        ["<CR>"] = function(fallback)
            if cmp.visible() then
                cmp.confirm()
            else
                fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
            end
        end,

        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,

        ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end
    }
}
