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
opt.guicursor = "n-v-c:block-Cursor,i-ci:ver25-CursorInsert,r-cr:hor20-CursorReplace"

-- Searching
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.inccommand = "nosplit"

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
map("n", "<C-j>", "<C-d>")
map("n", "<C-k>", "<C-u>")
map("v", "<C-j>", "<C-d>gv")
map("v", "<C-k>", "<C-u>gv")


-- [autocmd]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Load nvim-tree on session restore
autocmd("SessionLoadPost", {
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})
-- Remove trailing space
autocmd("BufWritePre", {
  pattern = "*",
  command = [[:%s/\s\+$//e]]
})

-- Close quick fix window after choosing
autocmd("FileType", {
  pattern = "qf",
  callback = function()
    map("n", "<CR>", "<CR><Cmd>cclose<CR>")
  end,
})

-- Indents by 2
autocmd("FileType", {
  pattern = "css,html,js,lua,xml",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
  end
})

-- Indents by 3
autocmd("FileType", {
  pattern = "rst",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 3
    vim.opt_local.softtabstop = 3
    vim.opt_local.tabstop = 3
  end
})

-- Indents by 4
autocmd("FileType", {
  pattern = "c,cmake,cpp,hpp,make,py",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
  end
})


-- [Theme]

require("theme").load()


-- [Plugins]

-- Helper function
local function add_plugin(start, name, author, hash)
  local github_url = "https://github.com/"
  local pack_path = vim.fn.stdpath("data") .. "/site/pack/"

  local group = "plugins"
  local group_path = pack_path .. group .. "/opt/"
  if start then
    group_path = pack_path .. group .. "/start/"
  end

  local plugin_path = group_path .. name
  local plugin_url = github_url .. author .. "/" .. name

  if vim.fn.empty(vim.fn.glob(plugin_path)) == 0 then
    vim.notify("Plugin installed   " .. name)
  else
    vim.notify("Plugin installing  " .. name .. " - " .. plugin_url)
    vim.fn.system({"git", "clone", "--depth=1", plugin_url, plugin_path})
  end

  if hash then
    vim.fn.system({"git", "-C", plugin_path, "checkout", hash})
  end

  if not start then
    vim.notify("Plugin loading     " .. name)
    vim.cmd.packadd(name)
  end
end

-- Plugin install
add_plugin(true, "bufferline.nvim",         "akinsho")
add_plugin(true, "colorful-winsep.nvim",    "nvim-zh")
add_plugin(true, "nvim-colorizer.lua",      "catgoose")
add_plugin(true, "cmp-buffer",              "hrsh7th")
add_plugin(true, "cmp-nvim-lsp",            "hrsh7th")
add_plugin(true, "fzf",                     "junegunn")
add_plugin(true, "fzf-lua",                 "ibhagwan")
add_plugin(true, "gitsigns.nvim",           "lewis6991")
add_plugin(true, "indent-blankline.nvim",   "lukas-reineke")
add_plugin(true, "lualine.nvim",            "nvim-lualine")
add_plugin(true, "lspsaga.nvim",            "nvimdev")
add_plugin(true, "nvim-cmp",                "hrsh7th")
add_plugin(true, "nvim-cursorword",         "xiyaowong")
add_plugin(true, "nvim-lspconfig",          "neovim")
add_plugin(true, "nvim-tree.lua",           "nvim-tree")
add_plugin(true, "nvim-treesitter",         "nvim-treesitter")
add_plugin(true, "nvim-web-devicons",       "nvim-tree")
add_plugin(true, "vscode.nvim",             "Mofiqul")

-- Plugin setup
require("plugins.setup")

-- cmp-nvim-lsp
local cmp_nvim_lsp_loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = nil
if cmp_nvim_lsp_loaded then
  capabilities = cmp_nvim_lsp.default_capabilities()
end

-- lspsaga
local lspsaga_loaded, lspsaga = pcall(require, "lspsaga")

-- fzf-lua
local fzf_lua_loaded, fzf_lua = pcall(require, "fzf-lua")
if fzf_lua_loaded then
  map("n", "<leader>ff", fzf_lua.files)
  map("n", "<leader>fb", fzf_lua.buffers)
  map("n", "<leader>ft", fzf_lua.tabs)
  map("n", "<leader>fs", fzf_lua.grep)
end


-- [LSP]

-- LSP keys
local on_attach = function(_, bufnr)

  vim.lsp.buf.switch_source_header = function()
    local params = { uri = vim.uri_from_bufnr(0) }
    vim.lsp.buf_request(0, 'textDocument/switchSourceHeader', params, function(err, result)
      if err then
        vim.notify('Clangd: error switching source/header: ' .. err.message, vim.log.levels.ERROR)
      elseif not result then
        vim.notify('Clangd: no corresponding file found', vim.log.levels.WARN)
      else
        vim.cmd('edit ' .. vim.uri_to_fname(result))
      end
    end)
  end

  local opts = { buffer = bufnr }
  map("n", "<leader>lf", vim.lsp.buf.format, opts)
  map("n", "<leader>lgd", vim.lsp.buf.definition, opts)
  map("n", "<leader>lgD", vim.lsp.buf.declaration, opts)
  map("n", "<leader>lgi", vim.lsp.buf.implementation, opts)
  map("n", "<leader>lgr", vim.lsp.buf.references, opts)
  map("n", "<leader>lh", vim.lsp.buf.hover, opts)
  map("n", "<leader>lo", vim.lsp.buf.switch_source_header, opts)
  map("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
  map("n", "<leader>lr", vim.lsp.buf.rename, opts)
  map("n", "<leader>lla", "<cmd>Lspsaga code_action<CR>", opts)
  map("n", "<leader>llh", "<cmd>Lspsaga hover_doc<CR>", opts)
  map("n", "<leader>llf", "<cmd>Lspsaga finder<CR>", opts)
  map("n", "<leader>llo", "<cmd>Lspsaga outline<CR>", opts)
  map("n", "<leader>llr", "<cmd>Lspsaga rename<CR>", opts)
  map("n", "<leader>dn", vim.diagnostic.goto_next, opts)
  map("n", "<leader>dN", vim.diagnostic.goto_prev, opts)
  map("n", "<leader>do", vim.diagnostic.open_float, opts)
  map("n", "<leader>dq", vim.diagnostic.setqflist, opts)
end

-- Hack for rounded borders on hover window.
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"

  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
--

-- Diagnostic
vim.diagnostic.config({
  float = {
	  border = "rounded",
	  header = ""
  },
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
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--limit-results=100",
    "--header-insertion=never"
  },
})

-- Python
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities
})

-- Lua
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
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


-- [User config]

local user_loaded, user = pcall(require, "user")
if user_loaded then

end


