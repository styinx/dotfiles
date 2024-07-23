return {
    'williamboman/mason-lspconfig.nvim',
    opts = {
        ensure_installed = {
            'clangd',
            'cmake',
            'lua_ls',
            'pyright'
        }
    }
}
