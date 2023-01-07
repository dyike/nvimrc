local _M = {}

function _M.config()
    local cmp = require 'cmp'
    cmp.setup{
        -- 必须指定 snippet 组件
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        -- 配置补全内容来源
        sources = cmp.config.sources {
            -- 支持从 lsp 服务补全
            { name = 'nvim_lsp' },
            -- 支持从打开的文件中补全内容
            { name = 'buffer' },
            -- 支持补全文件路径，可以输入 / 或者 ~ 体验
            { name = 'path' },
            { name = 'vsnip' },
        },

        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            })
        },
    }
    

    -- diagnostic_config = {
    --     -- Enable underline, use default values
    --     underline = true,
    --     -- Enable virtual text, override spacing to 2
    --     virtual_text = {
    --         spacing = 2,
    --         prefix = '<',
    --     },
    --     -- Use a function to dynamically turn signs off
    --     -- and on, using buffer local variables
    --     signs = function(bufnr, client_id)
    --         local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
    --         -- No buffer local variable set, so just enable by default
    --         if not ok then
    --             return true
    --         end
    
    --         return result
    --     end,
    --     -- Disable a feature
    --     update_in_insert = false,
    -- }
    
    -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_config)
    -- -- 在 diagnostic 之間跳轉
    -- -- 映射 `C-[` `C-]` 跳轉到上一個和下一個 diagnostic
    -- vim.api.nvim_set_keymap('n', 'C-[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',{silent = true, noremap = true})
    -- vim.api.nvim_set_keymap('n', 'C-]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',{silent = true, noremap = true})

	-- require('lspconfig').gopls.setup{
		
	-- }
end

return _M
