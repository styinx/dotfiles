return {
    {
        'Mofiqul/vscode.nvim',
        opts = {
            color_overrides = {
                vscFront = '#CCCCCC',
                vscBack = '#111111',
                vscLineNumber = '#666666',
                vscCursorDarkDark = '#282828',
            },
            group_overrides = {
                CursorLineNr = { fg = '#CCCCCC' },
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
