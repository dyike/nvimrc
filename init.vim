lua require('core.base')

autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports()

autocmd FileType makrdown setlocal spell
