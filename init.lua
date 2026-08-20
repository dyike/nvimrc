require('core.base')

<<<<<<< HEAD
local group = vim.api.nvim_create_augroup('MyAutocmd', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'markdown',
    callback = function()
        vim.opt_local.spell = true
    end,
})
=======
vim.api.nvim_exec([[
    augroup MyAutocmd
        autocmd!
        autocmd BufWritePre *.go lua if #vim.lsp.get_clients({bufnr=0}) > 0 then vim.lsp.buf.format({async=false}) end
        autocmd BufWritePre *.go lua goimports()
        autocmd FileType markdown setlocal spell
    augroup END
]], false)
>>>>>>> 1f2ce0a1ef3622fc62e60f156103e8b60c83ade0
