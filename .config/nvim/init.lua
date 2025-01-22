-- Line number
vim.wo.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

-- Mouse mode
vim.o.mouse = "a"

-- Text search
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.hlsearch = false

-- File scroll buffer
vim.o.scrolloff = 7

-- Tab
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Indentation
vim.o.smartindent = true
vim.o.expandtab = true

-- linewrap
vim.o.wrap = false

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

-- Color
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd("colorscheme retrobox")

-- Wildmenu
vim.o.wildmenu = true
vim.o.wildmode = "list:longest,list:full"

-- Completion
vim.o.completeopt = "menuone,longest,noselect"

-- Statusline
vim.o.statusline = "%f  buffer:%n  %m %r %=%l,%c   %p%%"

-- Others
vim.opt.backup = false
vim.opt.compatible = false

-- More: pluginless neovim
