<<<<<<< HEAD
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
=======
vim.g.rustaceanvim = {
    tools = {
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate"
                },
                cargo = {
                    allFeatures = true
                },
                checkOnSave = {
                    command = "clippy"
                },
                inlayHints = {
                    lifetimeElisionHints = {
                        enable = true,
                        useParameterNames = true
                    },
                },
            },
        }
    },
}
>>>>>>> 1f2ce0a1ef3622fc62e60f156103e8b60c83ade0
