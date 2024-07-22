return {
    'nvim-treesitter/nvim-treesitter',
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            'c',
            'cmake',
            'cpp',
            'diff',
            'doxygen',
            'json',
            'lua',
            'luadoc',
            'markdown',
            'printf',
            'python',
            'regex',
            'vim',
            'yaml',
        }
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
