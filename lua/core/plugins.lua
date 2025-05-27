return {
    { 'fioncat/vim-oceanicnext' },
    { 'Mofiqul/vscode.nvim' },
    -- 导航栏
    { 'preservim/nerdtree'},

    -- 导航栏显示git情况
    { 'Xuyuanp/nerdtree-git-plugin' },
    -- 注释
    { 'tpope/vim-commentary' },
    -- 语法检测
    { 'vim-syntastic/syntastic' },
    -- 状态栏主题
    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },

    -- 右侧状态栏，代码快速跳转
    { 'majutsushi/tagbar' },

    -- git
    {
        "f-person/git-blame.nvim",
        -- load the plugin at startup
        event = "VeryLazy",
        -- Because of the keys part, you will be lazy loading this plugin.
        -- The plugin wil only load once one of the keys is used.
        -- If you want to load the plugin at startup, add something like event = "VeryLazy",
        -- or lazy = false. One of both options will work.
        opts = {
            -- your configuration comes here
            -- for example
            enabled = true,  -- if you want to enable the plugin
            message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
            date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
            virtual_text_column = 1,  -- virtual text start column, check Start virtual text at column section for more options
        },
    },
    { 'airblade/vim-gitgutter' },

    -- 补全
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-vsnip' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/vim-vsnip' },

    { 'honza/vim-snippets' },
    { 'neovim/nvim-lspconfig' },

    -- C/C++/Lua
    { 'nvim-treesitter/nvim-treesitter' },

    -- Rust
    { 'simrat39/rust-tools.nvim' },

    -- search
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },

    { 'tpope/vim-vinegar' },
}
