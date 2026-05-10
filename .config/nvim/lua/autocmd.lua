-- [autocmd]

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd


-- [Buffer]

local buffer_group = augroup("Buffer", { clear = true })

-- Auto create missing file paths
autocmd("BufWritePre", {
  group = buffer_group,
  callback = function()
    local dir = vim.fn.expand("<afile>:p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Remove trailing space
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    for i, line in ipairs(lines) do
      lines[i] = line:gsub("%s+$", "")
    end
    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
    vim.api.nvim_win_set_cursor(0, pos)
  end,
})

-- Open buffer on last position
autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})


-- [Indents]

local indent_group = augroup("Indents", { clear = true })

local indents = {
  [2] = { "css", "html", "javascript", "lua", "xml" },
  [3] = { "rst" },
  [4] = { "c", "cmake", "cpp", "make", "python" },
}

for size, filetypes in pairs(indents) do
  autocmd("FileType", {
    group = indent_group,
    pattern = filetypes,
    callback = function()
      vim.opt_local.expandtab = true
      vim.opt_local.shiftwidth = size
      vim.opt_local.softtabstop = size
      vim.opt_local.tabstop = size
    end,
  })
end


-- [Misc]

local misc_group = augroup("Misc", { clear = true })

-- Close quick fix window after choosing
autocmd("FileType", {
  group = misc_group,
  pattern = { "qf" },
  callback = function()
    map("n", "<CR>", "<CR><Cmd>cclose<CR>")
  end,
})


-- [System]

local system_group = augroup("System", { clear = true })

-- Reload buffer
autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = system_group,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})


-- [Visual]

local visual_group = augroup("Visual", { clear = true })

-- Keep splits proportional
autocmd("VimResized", {
  group = visual_group,
  callback = function() vim.cmd("wincmd =") end,
})

-- Highlight when yanking
autocmd("TextYankPost", {
  group = visual_group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})
