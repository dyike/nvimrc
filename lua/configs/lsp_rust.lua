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
