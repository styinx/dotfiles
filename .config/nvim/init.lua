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

-- Visual
opt.signcolumn = "yes"

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

-- Helper function
local function map(mode, keys, action, options)
    if not options then
        options = {}
    end
    options["noremap"] = true
    options["silent"] = true
    vim.keymap.set(mode, keys, action, options)
end

vim.g.mapleader = " "

-- Default keys
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

-- Close quick fix window after choosing
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    map("n", "<CR>", "<CR><Cmd>cclose<CR>")
  end,
})

-- Lua
autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end
})


-- [Plugins]

-- Helper function
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
    vim.notify("Plugin installed   " .. plugin_name)
  else
    vim.notify("Plugin installing  " .. plugin_name .. " - " .. plugin_url)
    vim.fn.system({"git", "clone", "--depth=1", plugin_url, plugin_path})
  end

  if hash then
    vim.fn.system({"git", "-C", plugin_path, "checkout", hash})
  end

  if not start then
    vim.notify("Plugin loading     " .. plugin_name)
    vim.cmd.packadd(plugin_name)
  end
end

-- Plugin install
add_plugin(true, "akinsho/bufferline.nvim")
add_plugin(true, "ibhagwan/fzf-lua")
add_plugin(true, "junegunn/fzf")
add_plugin(true, "lukas-reineke/indent-blankline.nvim")
add_plugin(true, "Mofiqul/vscode.nvim")
add_plugin(true, "neovim/nvim-lspconfig")
add_plugin(true, "nvim-treesitter/nvim-treesitter")
add_plugin(true, "nvim-lualine/lualine.nvim")
add_plugin(false, "nvim-tree/nvim-web-devicons")
add_plugin(false, "nvim-tree/nvim-tree.lua")

-- Plugin setup
require("plugins.setup")

-- Plugin configuration
local vscode_loaded, _ = pcall(require, "vscode")
if vscode_loaded then
  vim.cmd.colorscheme("vscode")
end

local fzflua_loaded, fzflua = pcall(require, "fzf-lua")
if fzflua_loaded then
  map('n', '<leader>ff', fzflua.files)
  map('n', '<leader>fb', fzflua.buffers)
  map('n', '<leader>ft', fzflua.tabs)
end


-- [LSP]

-- LSP keys
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }
  map('n', '<leader>gd', vim.lsp.buf.definition, opts)
  map('n', '<leader>gD', vim.lsp.buf.declaration, opts)
  map('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  map('n', '<leader>gr', vim.lsp.buf.references, opts)
  map('n', '<leader>gh', vim.lsp.buf.hover, opts)
  map('n', '<leader>or', vim.lsp.buf.rename, opts)
  map('n', '<leader>oa', vim.lsp.buf.code_action, opts)
  map('n', '<leader>of', vim.lsp.buf.format, opts)
  map('n', '<leader>dn', vim.diagnostic.goto_next, opts)
  map('n', '<leader>dN', vim.diagnostic.goto_prev, opts)
  map('n', '<leader>do', vim.diagnostic.open_float, opts)
  map('n', '<leader>dq', vim.diagnostic.setqflist, opts)
end

-- Diagnostic
vim.diagnostic.config({
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    virtual_text = true,
    virtual_lines = false
})

-- LSP servers
local lspconfig = require('lspconfig')

-- C/C++
lspconfig.clangd.setup({on_attach = on_attach})

-- Python
lspconfig.pyright.setup({on_attach = on_attach})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim'
        }
      }
    }
  }
})


