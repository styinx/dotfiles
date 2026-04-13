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
  map("n", "<leader>llf", "<cmd>Lspsaga finder<CR>", opts)
  map("n", "<leader>llo", "<cmd>Lspsaga outline<CR>", opts)
  map("n", "<leader>llr", "<cmd>Lspsaga rename<CR>", opts)
end

-- LSP servers
vim.lsp.config("*", {
  on_attach = on_attach,
  root_markers = { ".git" },
})

-- C/C++
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--limit-results=100",
    "--header-insertion=never"
  },
  filetypes = { "c", "cpp" },
  root_markers = { ".clangd", "compile_commands.json" }
})

-- Lua
vim.lsp.config("lua_ls", {
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = {
          "vim"
        }
      }
    }
  }
})

-- Python
vim.lsp.config("pyright", {
  filetypes = { "python" },
})


-- Enable LSP servers
vim.lsp.enable({
  "clangd",
  "lua_ls",
  "pyright",
})
