require('core.base')

vim.api.nvim_exec([[
    augroup MyAutocmd
        autocmd!
        autocmd BufWritePre *.go lua if #vim.lsp.get_clients({bufnr=0}) > 0 then vim.lsp.buf.format({async=false}) end
        autocmd BufWritePre *.go lua goimports()
        autocmd FileType markdown setlocal spell
    augroup END
]], false)
