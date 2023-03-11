-- packer.nvim
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    -- 主题
    use 'fioncat/vim-oceanicnext'
    use 'Mofiqul/vscode.nvim'
    -- 导航栏
    use 'preservim/nerdtree'
    -- 导航栏显示git情况
    use 'Xuyuanp/nerdtree-git-plugin'
    -- 注释
    use 'tpope/vim-commentary'
    -- 语法检测
    use 'vim-syntastic/syntastic'
    -- 状态栏主题
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    -- 右侧状态栏，代码快速跳转
    use 'majutsushi/tagbar'

    -- git
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'

    -- 补全
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/vim-vsnip'

    -- use 'junegunn/vim-easy-align' -- 快速补全
    -- use 'SirVer/ultisnips'
    use 'honza/vim-snippets'
    use {
        'neovim/nvim-lspconfig',
    }

    -- languages
    -- golang
    -- use { 'nsf/gocode', rtp='vim/' }
    -- use 'mattn/vim-goimports'
    -- use 'dgryski/vim-godef'
    -- use {
    --     'fatih/vim-go',
    --     run = ':GoUpdateBinaries',
    --     ft = 'go',
    -- }

    -- C/C++/Lua/...
    use 'nvim-treesitter/nvim-treesitter'

    -- Rust
    use 'simrat39/rust-tools.nvim'

    -- search
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        cmd = 'Telescope',
    }

    use 'tpope/vim-vinegar'

end)
