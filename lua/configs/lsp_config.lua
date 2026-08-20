local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- 配置标准补全快捷键
    -- 在插入模式可以按 <c-x><c-o> 触发补全
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- 跳转到下一个/上一个语法错误
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<CR>', opts)
    -- 手工触发格式化
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
    buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- 修改当前符号的名字
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- 列出所有语法错误列表
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end

vim.lsp.config('*', {
    capabilities = capabilities,
    on_attach = on_attach,
})

vim.lsp.config('gopls', {
    root_dir = function(bufnr, on_dir)
        local filename = vim.api.nvim_buf_get_name(bufnr)
        local root = vim.fs.root(filename, { 'go.work', 'go.mod', '.git' })
        on_dir(root or vim.fs.dirname(filename))
    end,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                nilness = true,
                unusedwrite = true,
                useany = true,
            },
            staticcheck = true,
            usePlaceholders = true,
        },
    },
})

vim.lsp.enable({ 'gopls', 'clangd', 'bashls', 'pyright' })

local function organize_imports(client, bufnr, timeout_ms)
    local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
    params.context = { only = { "source.organizeImports" } }

    local response = client:request_sync('textDocument/codeAction', params, timeout_ms, bufnr)
    for _, action in ipairs(response and response.result or {}) do
        if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
        end
        local command = type(action.command) == 'table' and action.command
            or type(action.command) == 'string' and action
        if command then
            client:exec_cmd(command, { bufnr = bufnr })
        end
    end
end

local go_format_group = vim.api.nvim_create_augroup('GoLspFormat', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
    group = go_format_group,
    pattern = '*.go',
    callback = function(args)
        local clients = vim.lsp.get_clients({ bufnr = args.buf, name = 'gopls' })
        local client = clients[1]
        if not client then
            return
        end

        if client:supports_method('textDocument/codeAction') then
            organize_imports(client, args.buf, 1000)
        end
        if client:supports_method('textDocument/formatting') then
            vim.lsp.buf.format({
                bufnr = args.buf,
                async = false,
                timeout_ms = 2000,
                filter = function(format_client)
                    return format_client.id == client.id
                end,
            })
        end
    end,
})
