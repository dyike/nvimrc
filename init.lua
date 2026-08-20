require('core.base')

local group = vim.api.nvim_create_augroup('MyAutocmd', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = group,
    pattern = 'markdown',
    callback = function()
        vim.opt_local.spell = true
    end,
})
