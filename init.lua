require('core.base')

vim.api.nvim_exec([[
    augroup MyAutocmd
        autocmd!
        autocmd BufWritePre *.go lua vim.lsp.buf.format({async=false})
        autocmd BufWritePre *.go lua goimports()
        autocmd FileType makrdown setlocal spell
    augroup END
]], false)
