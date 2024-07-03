require("trouble").setup {}

vim.cmd [[
nnoremap <leader>d <CMD>Trouble diagnostics toggle<CR>
nnoremap <leader>s <CMD>Trouble symbols toggle<CR>
]]
