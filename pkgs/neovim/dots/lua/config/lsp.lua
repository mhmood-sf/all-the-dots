-- LSP Config

local lspcfg = require "lspconfig"

-- Taken from https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
-- Opens diagnostics in float.
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
-- vim.o.updatetime = 1000
-- vim.cmd [[autocmd! CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Add borders
-- See: https://vi.stackexchange.com/a/39075
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = "solid" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = "solid" }
)

vim.diagnostic.config {
    underline = true,
    virtual_text = false,
    float = { border = "solid" },
}

--[ Mappings ]--
vim.cmd [[
nnoremap <leader>i <CMD>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>e <CMD>lua vim.diagnostic.open_float(nil, {focus=false})<CR>
nnoremap <leader>a <CMD>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>d <CMD>Telescope lsp_definitions<CR>
]]

-- Lua Language Server
require("lspconfig").lua_ls.setup {
  on_init = function (client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path.."/.luarc.json") or vim.loop.fs_stat(path.."/.luarc.jsonc") then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT"
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of "runtimepath". NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

-- ClangD (C/C++)
lspcfg.clangd.setup {}

-- Nil (Nix)
lspcfg.nil_ls.setup {}

-- ZLS (Zig)
lspcfg.zls.setup {}

-- Markdown (Marksman)
lspcfg.marksman.setup {}

-- TypeScript (deno)
lspcfg.denols.setup {}
