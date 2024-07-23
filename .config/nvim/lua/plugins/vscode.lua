return {
    {
        'Mofiqul/vscode.nvim',
        opts = {
            color_overrides = {
                vscLineNumber = '#666666'
            },
            group_overrides = {
                CursorLine = { bg = '#282828' },
                Normal = { fg = '#DDDDDD', bg = '#111111' },
            }
        }
    },

    {
        'LazyVim/LazyVim',
        opts = { colorscheme = 'vscode' }
    },

    {
        'nvim-lualine/lualine.nvim',
        opts = { theme = 'vscode' }
    }
}
