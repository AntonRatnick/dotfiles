local opt = vim.opt
local o = vim.o
local wo = vim.wo

-- Appearance
opt.laststatus = 2
opt.numberwidth = 4
opt.number = true
opt.list = true
opt.listchars:append('lead:⋅')
opt.listchars:append('eol:↴')
opt.cmdheight = 0
opt.cursorline = true
o.guifont = 'VictorMono Nerd Font Mono'
opt.termguicolors = true

-- Other TBD
o.hlsearch = false   -- No highlighting for search
o.ignorecase = true -- Ignore case for search
o.shell = 'nu'

opt.smartindent = true

opt.scrolloff = 999  -- To keep the curosor in the middle of the screen
opt.undolevels = 1000000
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 2   -- shift 4 spaces when tab
opt.tabstop = 2

o.clipboard = 'unnamedplus' -- Use system clipboard
o.completeopt = 'menuone,noinsert,noselect'

o.undodir = '/Users/anton_ratnikov/.nvim/undo-dir'
o.undofile = true
opt.swapfile = false

wo.number = true

opt.grepformat:append("%f:%l:%c:%m")
opt.grepprg = "rg --vimgrep"


vim.g.mapleader = " "

vim.g.equalalways = false
