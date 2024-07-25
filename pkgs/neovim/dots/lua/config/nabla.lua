local keymap = vim.keymap

keymap.set("n", "<leader>m", "<CMD>lua require'nabla'.popup({border='solid'})<CR>", {
    desc = "Render math in a popup window."
})

keymap.set("n", "<leader>M", "<CMD>lua require'nabla'.toggle_virt()<CR>", {
    desc = "Render math in current document using virtual text."
})
