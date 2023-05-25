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
end

return _M
