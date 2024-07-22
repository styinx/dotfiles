local opt = vim.opt


-- [System]

opt.belloff = 'all'
opt.errorbells = false
opt.visualbell = true
opt.backup = false
opt.autoread = true
opt.showcmd = true

-- [Visual]

-- Syntax
opt.syntax = 'on'
opt.guifont = 'DroidSansM Nerd Font:h10.5:l'

-- [Editor]

-- ...
opt.clipboard = 'unnamedplus'
opt.encoding = 'utf-8'
opt.compatible = false
opt.swapfile = false
opt.mouse = 'a'
opt.spell = true

-- Cursor
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10

-- Searching
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true

-- Spacing
opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.tabstop = 4

-- Special characters
opt.list = true
opt.listchars = {
    eol = '¬',
    extends = '›',
    precedes = '‹',
    space = '·',
    tab = '» ',
    trail = '·'
}


