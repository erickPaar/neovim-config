-- Leader key (must be set before lazy.nvim)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable netrw (for neo-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation (Kotlin standard: 4 spaces)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Backup/Swap
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true

-- Misc
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- jsonc (JSON with comments) uses the json treesitter parser, which already accepts comments;
-- nvim-treesitter's own jsonc parser fails to download.
vim.treesitter.language.register("json", "jsonc")

-- Folding for JSON: fold by structure (each object and array) with treesitter.
-- foldlevel 99 opens the file with every fold open; zM closes them all.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("json_folding", { clear = true }),
  pattern = { "json", "jsonc" },
  callback = function()
    vim.opt_local.foldmethod = "expr"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldlevel = 99
  end,
})
