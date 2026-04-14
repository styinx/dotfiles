-- Helper function
local function map(mode, keys, action, options)
    options = options or {}
    options["noremap"] = true
    options["silent"] = true
    vim.keymap.set(mode, keys, action, options)
end
-- [Diagnostic]

-- Diagnostic config
vim.diagnostic.config({
  float = {
    border = "rounded",
    header = "",
    source = "if_many",
    style = "minimal",
  },
  severity_sort = true,
  signs = {
    linehl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticErrorLine",
      [vim.diagnostic.severity.WARN]  = "DiagnosticWarnLine",
      [vim.diagnostic.severity.HINT]  = "DiagnosticHintLine",
      [vim.diagnostic.severity.INFO]  = "DiagnosticInfoLine",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
      [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
      [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
    },
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅙",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "󰌵",
    },
  },
  underline = true,
  update_in_insert = true,
  virtual_text = {
    prefix = "●",
    source = "if_many",
    spacing = 4,
  },
  virtual_lines = false
})

-- Diagnostic keys
map("n", "<leader>dn", vim.diagnostic.goto_next)
map("n", "<leader>dN", vim.diagnostic.goto_prev)
map("n", "<leader>do", vim.diagnostic.open_float)
map("n", "<leader>dq", vim.diagnostic.setqflist)
