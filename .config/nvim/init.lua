local opt = vim.opt


-- [System]

opt.belloff = "all"
opt.errorbells = false
opt.visualbell = true
opt.backup = false
opt.autoread = true
opt.showcmd = true


-- [Visual]

-- Syntax
opt.background = "dark"
opt.syntax = "on"
opt.guifont = "DroidSansM Nerd Font:h10.5:l"


-- [Editor]

-- ...
opt.clipboard = "unnamedplus"
opt.encoding = "utf-8"
opt.compatible = false
opt.swapfile = false
opt.mouse = "a"
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
    eol = "¬",
    extends = "›",
    precedes = "‹",
    space = "·",
    tab = "» ",
    trail = "·"
}


-- [Keyboard]

local function map(mode, keys, action, options)
    if not options then
        options = {}
    end
    options["noremap"] = true
    vim.api.nvim_set_keymap(mode, keys, action, options)
end

vim.g.mapleader = " "

map("i", "jk", "<Esc>")
map("i", "{", "{}<Esc>i")
map("i", "[", "[]<Esc>i")
map("i", "(", "()<Esc>i")
map("i", "'", "''<Esc>i")
map("i", '"', '""<Esc>i')
map("n", "<leader>o", "<Esc>o<Esc>")
map("n", "<leader>O", "<Esc>O<Esc>")


-- [autocmd]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing space
autocmd("BufWritePre", {
  pattern = "*",
  command = [[:%s/\s\+$//e]]
})

-- Format C/C++ files on save
autocmd("BufWritePre", {
  pattern = "*.c,*.cc,*.cpp,*.h,*.hpp",
  command = "format()"
})


-- [Plugins]

local function add_plugin(start, plugin, hash)
  local github_url = "https://github.com/"
  local pack_path = vim.fn.stdpath("data") .. "/site/pack/"

  local group = "plugins"
  local group_path = pack_path .. group .. "/opt/"
  if start then
    group_path = pack_path .. group .. "/start/"
  end

  local plugin_name = string.match(plugin, "%w+/([%w%p]+)")
  local plugin_path = group_path .. plugin_name
  local plugin_url = github_url .. plugin

  if vim.fn.empty(vim.fn.glob(plugin_path)) == 0 then
    vim.notify("Plugin '" .. plugin_name .. "': Already installed")
  else
    vim.notify("Plugin '" .. plugin_name .. "': Installing " .. plugin_url)
    vim.fn.system({"git", "clone", "--depth=1", plugin_url, plugin_path})
  end

  if hash then
    vim.fn.system({"git", "-C", plugin_path, "checkout", hash})
  end

  if not start then
    vim.notify("Plugin '" .. plugin_name .. "': Loading")
    vim.cmd.packadd(plugin_name)
  end
end

-- Plugin install
add_plugin(true, "akinsho/bufferline.nvim")
add_plugin(true, "ibhagwan/fzf-lua")
add_plugin(true, "junegunn/fzf")
add_plugin(true, "lukas-reineke/indent-blankline.nvim")
add_plugin(true, "Mofiqul/vscode.nvim")
add_plugin(true, "nvim-treesitter/nvim-treesitter")
add_plugin(true, "nvim-lualine/lualine.nvim")
add_plugin(false, "nvim-tree/nvim-web-devicons")
add_plugin(false, "nvim-tree/nvim-tree.lua")

-- Plugin setup
require("plugins.setup")

-- Plugin configuration
if pcall(require, "vscode") then
  vim.cmd.colorscheme("vscode")
end

