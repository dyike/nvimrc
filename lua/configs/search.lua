local _M = {}

function _M.config()
    -- fuzzy finder
    -- brew install ripgrep
    vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", {noremap = true})
    vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {noremap = true})
end

return _M
