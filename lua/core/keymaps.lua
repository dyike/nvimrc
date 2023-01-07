vim.g.mapleader = ','

function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tal_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- basic
map('i', '<C-g>', '<esc>')

-- Toggle NERDTree sidebar
map('n', "<C-n>", ":NERDTreeToggle<CR>")
-- Toggle the Tagbar window
map('n', "<leader>tt", ":TagbarToggle<CR>")

-- visual mode下选中的内容复制到粘贴板
map('v', '<leader>yy', '"+yy')
map('v', '<leader>xx', '"+xx')

-- Turn off search highlight
map('n', '<leader><space>', ':noh<CR>' )

-- git
map('n', '<leader>g?', ':Git blame<CR>')
map('n', '<leader>gdf', ':Gdiffsplit<CR>')

-- 分屏
map('n', '<leader>w-', ':sv<CR>')
map('n', "<leader>w\\", ":vs<CR>")

-- FZF search
-- map('n', '<C-s>', ':Files<CR>')
-- map('n', '<C-g>', ':Rg<CR>')

-- vim-go
-- map('n', 'gr', '<Plug>(go-referrers)')
