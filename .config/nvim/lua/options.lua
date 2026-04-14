local opt = vim.opt

-- [System]

opt.autoread = true                             -- Reload files modified outside of Nvim
opt.backup = false                              -- Do not use backup files
opt.belloff = "all"                             -- Disable bell for all events
opt.errorbells = false                          -- Disable bell
opt.swapfile = false                            -- Do not use a swap file
opt.undofile = true                             -- Keep undo history after closing
opt.undodir = vim.fn.expand("~/.vim/undodir")   -- Undo directory
opt.visualbell = true                           -- Use visual bell instead of beeping


-- [Visual]

-- Appearance
opt.background = "dark"                         -- Adjust color groups to dark colors
opt.guifont = "DroidSansM Nerd Font:h10.5:l"    -- Overwrite default font


-- [Editor]

-- ...
opt.backspace = { "indent", "eol", "start" }    -- Default backspace behaviour
opt.clipboard = "unnamed,unnamedplus"           -- Use system clipboard
opt.fileencoding = "utf-8"                      -- File encoding
opt.mouse = "a"                                 -- Enable mouse support for every mode
opt.spell = true                                -- Enable spell checking
opt.spelllang = { "en" }                        -- Use English for spell checking
opt.splitright = true                           -- Vertical splits always right
opt.splitbelow = true                           -- Horizontal splits always below
opt.wrap = false                                -- Disable line wrapping

-- Timing
opt.timeoutlen = 500                            -- Time between key events
opt.matchtime = 1                               -- Time to show matching brackets

-- Visual
opt.cmdheight = 1                               -- Height of command line
opt.foldmethod = "indent"                       -- Lines with equal indent form a fold
opt.foldlevel = 99                              -- Fold all nesting levels
opt.foldenable = true                           -- Enable folding
opt.signcolumn = "yes:1"                        -- Always show sign column with width of 1
opt.showcmd = true                              -- Show last command
opt.showmatch = true                            -- Highlight matching brackets
opt.termguicolors = true                        -- Enable 24 bit RGB colors
opt.synmaxcol = 140                             -- Syntax highlight column limit

-- Windows
opt.winminwidth = 10                            -- Use rounded borders for windows
opt.winborder = "rounded"                       -- Use rounded borders for windows

-- Cursor
opt.cursorline = true                           -- Highlight current line
opt.guicursor = "n-v-c:block-Cursor,i-ci:ver25-CursorInsert,r-cr:hor20-CursorReplace"
opt.number = true                               -- Show line number
opt.numberwidth = 2                             -- Minimum width of line number
opt.relativenumber = true                       -- Use relative line numbers
opt.scrolloff = 10                              -- Show at least 10 rows above or below the cursor
opt.scrolloff = 8                               -- Show at least 8 columns left or right of the cursor

-- Searching
opt.hlsearch = true                             -- Highlight all search results
opt.ignorecase = true                           -- Disable case sensitive search
opt.smartcase = true                            -- Override ignorecase when searching for upper case
opt.incsearch = true                            -- Show matches while typing
opt.inccommand = "nosplit"                      -- Show effects of commands while typing

-- Spacing
opt.autoindent = true                           -- Copy indent from current line
opt.expandtab = true                            -- Replace tabs with spaces
opt.shiftround = true                           -- Round shift to shiftwidth
opt.shiftwidth = 4                              -- Number of spaces used for indent
opt.smarttab = true                             -- Insert spaces for tabs in edit mode
opt.softtabstop = 4                             -- Number of spaces used for tabs in edit mode
opt.tabstop = 4                                 -- Space of tab

-- Special characters
opt.list = true                                 -- Show whitespace characters
opt.listchars = {                               -- Define whitespace characters
    eol = "¬",
    extends = "›",
    precedes = "‹",
    space = "·",
    tab = "»·",
    trail = "·"
}

