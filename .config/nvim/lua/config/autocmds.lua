local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Remove trailing space
autocmd('BufWritePre', {
    pattern = '*',
    command = [[:%s/\s\+$//e]]
})

-- Format C/C++ files on save
autocmd('BufWritePre', {
    pattern = '*.c,*.cc,*.cpp,*.h,*.hpp',
    command = 'format()'
})
