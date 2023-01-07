local _M = {}

function _M.config()
    -- fuzzy finder
    -- brew install ripgrep
    vim.api.nvim_set_keymap('n', '<C-g>', "<cmd>Telescope live_grep<cr>", {noremap = true})
    vim.api.nvim_set_keymap('n', '<C-s>', "<cmd>Telescope find_files<cr>", {noremap = true})
end

return _M