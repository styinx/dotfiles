-- [autocmd]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- [Indents]

-- Indents by 2
autocmd("FileType", {
  pattern = { "css", "html", "js", "lua", "xml" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.tabstop = 2
  end
})

-- Indents by 3
autocmd("FileType", {
  pattern = { "rst" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 3
    vim.opt_local.softtabstop = 3
    vim.opt_local.tabstop = 3
  end
})

-- Indents by 4
autocmd("FileType", {
  pattern = { "c", "cmake", "cpp", "hpp", "make", "py" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
    vim.opt_local.tabstop = 4
  end
})


-- []

-- Close quick fix window after choosing
autocmd("FileType", {
  pattern = { "qf" },
  callback = function()
    map("n", "<CR>", "<CR><Cmd>cclose<CR>")
  end,
})


-- [Buffer]

-- Remove trailing space
autocmd("BufWritePre", {
  pattern = "*",
  command = [[:%s/\s\+$//e]]
})
