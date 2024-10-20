--[ Editor options ]--
vim.o.ai    = true  -- autoindent: Indent new lines the same as previous.
vim.o.cul   = true  -- cursorline: Highlight current line.
vim.o.et    = true  -- expandtab: Convert tabs to whitespace.
vim.o.hls   = true  -- hlsesarch: Highlight search results.
vim.o.ic    = true  -- ignorecase: Case-insensitive matching.
vim.o.list  = true  -- list: Show trailing whitespace.
vim.o.lz    = true  -- lazyredraw: Postpone redraws for various commands.
vim.o.nu    = true  -- number: Show line numbers.
vim.o.ru    = true  -- ruler: Show cursor position in default statusline.
vim.o.sc    = true  -- showcmd: Show command as it is being typed.
vim.o.sm    = true  -- showmatch: Show matching brackets.
vim.o.tgc   = true  -- termguicolors: Use gui colors in terminal.
vim.o.title = false -- title: Don't set terminal title.
vim.o.udf   = true  -- undofile: Save undo tree for persistent undo's.
vim.o.wrap  = false -- wrap: Dont wrap lines.

vim.o.fdls  = 2 -- foldlevelstart: Open files with fold level set to 2.
vim.o.ls    = 2 -- laststatus: Always show one statusline.
vim.o.so    = 9 -- scrolloff: 9 lines scroll offset.
vim.o.sts   = 4 -- softtabstop: 4 spaces as one tab.
vim.o.sw    = 4 -- shiftwidth: Autoindent width.
vim.o.ts    = 4 -- tabstop: Number of cols in one tab char.
vim.o.tw    = 0 -- textwidth: Max width, longer lines are broken up.

vim.o.cc    = "80"     -- colorcolumn: Highlight col to help align text.
vim.o.fdc   = "auto:9" -- foldcolumn: Show lines in gutter indicating folds.
vim.o.fdm   = "expr"   -- foldmethod: How to set folds in a file.
vim.o.ff    = "unix"   -- fileformat: Unix file endings.
vim.o.spl   = "en_gb"  -- spelllang: Set spelling language.

-- fillchars: Characters for window separators and special lines.
vim.o.fcs = "vert:┃,horiz:━,fold: ,foldopen:╭,foldsep:│,foldclose:›"
-- foldexpr: Use treesitter to define folds.
vim.o.fde = "v:lua.vim.treesitter.foldexpr()"
-- splitkeep: Keep topline same when scrolling windows.
vim.o.spk = "topline"
-- undodir: Directory for the undofile
vim.o.udir = vim.fn.stdpath("data") .. "/undo/"
-- wildmode: Bash-like tab completion.
vim.o.wim = "longest,list"

--[ TeX FT Plugin Options ]--
vim.g.tex_flavor = "latex"

--[ Netrw Options ]--
vim.g.netrw_preview = 1
vim.g.netrw_winsize = 20
vim.g.newtrw_liststyle = 3

--[ Mappings ]--
vim.g.mapleader = " "

local keymap = vim.keymap

-- General QOL.
keymap.set("n", "<Enter>", "o<Esc>", {
    desc = "Insert new line without leaving normal mode."
})

keymap.set("n", ";", ":", {
    desc = "Avoid pressing shift every time to enter command mode."
})

keymap.set("t", "<Esc>", "<C-\\><C-n>", {
    desc = "Use <Esc> to exit terminal-insert mode."
})

keymap.set("n", "<Esc>", "<CMD>nohlsearch|diffupdate<CR><C-L>", {
    desc = "Clear search highlighting"
})

-- Window sizes.
keymap.set("n", "<Up>",    "<C-W>+", {
    desc = "Increase vertical window size."
})

keymap.set("n", "<Down>",  "<C-W>-", {
    desc = "Decrease vertical window size."
})

keymap.set("n", "<Right>", "<C-W>>", {
    desc = "Increase horizontal window size."
})

keymap.set("n", "<Left>",  "<C-W><", {
    desc = "Decrease horizontal window size."
})

-- Jumping to start/end of current line.
keymap.set("n", "<S-h>", "^zz", {
    desc = "Jump to first non-blank char of current line, and center cursor."
})

keymap.set("n", "<S-l>", "$zz", {
    desc = "Jump to last char of current line, and center cursor."
})

-- Scrolling.
keymap.set("n", "<S-j>", "<C-d>M", {
    desc = "Scroll down based on 'scroll' option, and center cursor."
})
keymap.set("n", "<S-k>", "<C-u>M", {
    desc = "Scroll up based on 'scroll' option, and center cursor."
})

-- Opening splits.
keymap.set("n", "<C-h>", "<CMD>vsplit<CR>", {
    desc = "Open a vertical split, focused on the left split."
})

keymap.set("n", "<C-j>", "<CMD>split<CR><C-w>j", {
    desc = "Open a horizontal split, focused on the lower split."
})

keymap.set("n", "<C-k>", "<CMD>split<CR>", {
    desc = "Open a horizontal split, focused on the upper split."
})

keymap.set("n", "<C-l>", "<CMD>vsplit<CR><C-w>l", {
    desc = "Open a vertical split, focused on the right split."
})

--[ Plugins & Colorscheme ]--
vim.g.aks_variant = "light"
vim.cmd "colorscheme aks"

require "config.statusline"
require "config.gitsigns"
require "config.autopairs"
require "config.cmp"
require "config.lsp"
-- require "config.snippets" -- TODO: Neovim v0.10.0
require "config.telescope"
require "config.treesitter"
require "config.nabla"
