vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importEnforceGranularity = true,
                importPrefix = 'crate',
            },
            cargo = {
                allFeatures = true,
            },
            check = {
                command = 'clippy',
            },
        },
    },
})

vim.lsp.enable('rust_analyzer')
