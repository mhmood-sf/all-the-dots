local cmp = require("cmp")

cmp.setup {
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" }
    },

    mapping = {
        ['<CR>'] = function(fallback)
            if cmp.visible() then
                cmp.confirm()
            else
                fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
            end
        end,

        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end
    }
}
