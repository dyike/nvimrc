local _M = {}

-- 自动检测虚拟环境
local function find_python_executable()
    local venv_paths = {
        '.venv/bin/python',
        'venv/bin/python',
        '.env/bin/python',
        'env/bin/python',
    }
    
    -- 检查当前目录及父目录的虚拟环境
    local current_dir = vim.fn.getcwd()
    for _, venv_path in ipairs(venv_paths) do
        local full_path = current_dir .. '/' .. venv_path
        if vim.fn.executable(full_path) == 1 then
            return full_path
        end
    end
    
    -- 检查环境变量
    if vim.env.VIRTUAL_ENV then
        local venv_python = vim.env.VIRTUAL_ENV .. '/bin/python'
        if vim.fn.executable(venv_python) == 1 then
            return venv_python
        end
    end
    
    -- 检查 conda 环境
    if vim.env.CONDA_DEFAULT_ENV then
        local conda_python = vim.fn.system('which python'):gsub('\n', '')
        if vim.fn.executable(conda_python) == 1 then
            return conda_python
        end
    end
    
    -- 默认 python
    return 'python3'
end

-- 获取 Python 路径
local function get_python_path()
    local python_exe = find_python_executable()
    return python_exe
end

function _M.setup_python_lsp()
    local lspconfig = require('lspconfig')
    local util = require('lspconfig.util')
    
    -- 获取当前 Python 路径
    local python_path = get_python_path()
    
    -- 配置 pyright
    lspconfig.pyright.setup({
        settings = {
            python = {
                pythonPath = python_path,
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                    typeCheckingMode = "basic",
                    autoImportCompletions = true,
                },
            },
        },
        root_dir = util.root_pattern('.git', 'setup.py', 'setup.cfg', 'pyproject.toml', 'requirements.txt'),
        on_attach = function(client, bufnr)
            -- 通用的 LSP on_attach 功能
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

            local opts = { noremap=true, silent=true }
            buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
            buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
            buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)
            buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
            buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
            buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
            
            -- Python 特定的快捷键
            buf_set_keymap('n', '<leader>pi', '<cmd>PyrightOrganizeImports<CR>', opts)
            
            -- 显示当前使用的 Python 解释器
            print("Python LSP using: " .. python_path)
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
    })
end

-- 虚拟环境状态显示
function _M.show_python_env()
    local python_path = get_python_path()
    local venv_name = vim.env.VIRTUAL_ENV and vim.fn.fnamemodify(vim.env.VIRTUAL_ENV, ':t') or 'system'
    print(string.format("Python: %s (venv: %s)", python_path, venv_name))
end

-- 自动格式化 Python 代码
function _M.setup_python_format()
    local group = vim.api.nvim_create_augroup("PythonFormat", { clear = true })
    
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        pattern = "*.py",
        callback = function()
            vim.lsp.buf.format({ async = false })
        end,
    })
end

-- 设置 Python 特定的选项
function _M.setup_python_options()
    local group = vim.api.nvim_create_augroup("PythonOptions", { clear = true })
    
    vim.api.nvim_create_autocmd("FileType", {
        group = group,
        pattern = "python",
        callback = function()
            -- Python 缩进设置
            vim.opt_local.tabstop = 4
            vim.opt_local.shiftwidth = 4
            vim.opt_local.softtabstop = 4
            vim.opt_local.expandtab = true
            
            -- 显示当前 Python 环境
            _M.show_python_env()
        end,
    })
end

-- 创建用户命令
function _M.setup_commands()
    -- 显示当前 Python 环境
    vim.api.nvim_create_user_command('PyEnv', function()
        _M.show_python_env()
    end, { desc = 'Show current Python environment' })
    
    -- 重启 Python LSP
    vim.api.nvim_create_user_command('PyRestartLsp', function()
        vim.cmd('LspRestart pyright')
        print('Python LSP restarted')
    end, { desc = 'Restart Python LSP server' })
end

function _M.config()
    _M.setup_python_lsp()
    _M.setup_python_format()
    _M.setup_python_options()
    _M.setup_commands()
end

return _M 