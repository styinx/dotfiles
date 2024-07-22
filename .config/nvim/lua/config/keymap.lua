local function map(mode, keys, action, options)
    if not options then
        options = {}
    end
    options['noremap'] = true
    vim.api.nvim_set_keymap(mode, keys, action, options)
end

vim.g.mapleader = ' '

map('i', 'jk', '<Esc>')
