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
    { 'tpope/vim-fugitive' },
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
