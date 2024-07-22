local installed, telescope = pcall(require, 'telescope')
local builtin, utils = nil, nil

if installed then
    builtin = require('telescope.builtin')
    utils = require('telescope.utils')
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            file_ignore_patterns = {
                '.git',
                '%.a',
                '%.o',
                '%.pyc',
                '%.dll',
                '%.exe',
                '%.so',
            }
        }
    },
    keys = {
        -- Search and Find
        {
            '<leader>/',
            function() builtin.live_grep() end,
            mode = 'n',
            desc = 'Live grep'
        },
        {
            '<leader>ff',
            function() builtin.find_files() end,
            mode = 'n',
            desc = 'Find files'
        },
        {
            '<leader>fb',
            function()
                opts = {
                    cwd = vim.fn.expand('%:p:h')
                }
                builtin.find_files( opts )
            end,
            mode = 'n',
            desc = 'Find files from buffer'
        },
        {
            '<leader>ft',
            function() builtin.tags() end,
            mode = 'n',
            desc = 'Find tags'
        },
        -- LSP
        {
            '<leader>cr',
            function() builtin.lsp_references() end,
            mode = 'n',
            desc = 'Code references'
        },
        {
            '<leader>cd',
            function() builtin.lsp_definitions() end,
            mode = 'n',
            desc = 'Code definition'
        },
        {
            '<leader>ci',
            function() builtin.lsp_implementations() end,
            mode = 'n',
            desc = 'Code implementation'
        },
    },
}
