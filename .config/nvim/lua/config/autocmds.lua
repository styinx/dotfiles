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
local function show_unconst_caps(args)
  local token = args.data.token
  if token.type ~= "variable" or token.modifiers.readonly then return end

  local text = vim.api.nvim_buf_get_text(
    args.buf, token.line, token.start_col, token.line, token.end_col, {})[1]
  if text ~= string.upper(text) then return end

  vim.lsp.semantic_tokens.highlight_token(
    token, args.buf, args.data.client_id, "Error")
end

vim.api.nvim_create_autocmd("LspTokenUpdate", {
  callback = show_unconst_caps,
})
