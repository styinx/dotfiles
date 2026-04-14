-- Helper function
local function map(mode, keys, action, options)
    options = options or {}
    options["noremap"] = true
    options["silent"] = true
    vim.keymap.set(mode, keys, action, options)
end
-- [Keyboard]

vim.g.mapleader = " "

-- Normal mode
map("n", "<leader>o",   "<Esc>o<Esc>")
map("n", "<leader>O",   "<Esc>O<Esc>")
map("n", "<C-j>",       "<C-d>zz")
map("n", "<C-k>",       "<C-u>zz")
map("n", "<leader>bn",  ":bn<CR>")
map("n", "<leader>bp",  ":bp<CR>")
map("n", "<Tab>",       ":bn<CR>")
map("n", "<S-Tab>",     ":bp<CR>")

-- Insert mode
map("i", "jk",          "<Esc>")
map("i", "{",           "{}<Esc>i")
map("i", "[",           "[]<Esc>i")
map("i", "(",           "()<Esc>i")
map("i", "'",           "''<Esc>i")
map("i", '"',           '""<Esc>i')
map("i", '.',           ".<c-g>u")
map("i", ',',           ",<c-g>u")
map("i", ';',           ";<c-g>u")

-- Visual mode
map("v", "<",           "<gv")
map("v", ">",           ">gv")
map("v", "<C-j>",       "<C-d>zzgv")
map("v", "<C-k>",       "<C-u>zzgv")
