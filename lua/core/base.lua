-- basics
vim.cmd('syntax on')
vim.cmd('set termguicolors')
vim.cmd('filetype plugin indent on')
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- line number
vim.o.number         = true
vim.o.relativenumber = false
-- hjkl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 高亮所在行
vim.o.cursorline     = true
vim.o.termguicolors  = true
vim.o.shiftround     = true
vim.o.updatetime     = 100
vim.o.autowrite      = true

-- 禁用mouse
vim.o.mouse = false

-- paste toggle
vim.o.pastetoggle = '<F5>'

-- tabs
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- 1tab缩进4个空格
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = false
-- >> << 时移长度
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

-- 空格代替tab
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autowrite = false

-- search
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true

-- set foldenable
-- z-a open current folden block
-- z-M close all folden block
-- z-R open all folden block
vim.o.foldmethod = 'indent'
vim.o.foldmethod = 'syntax'
vim.o.foldenable = false

-- set syntastic for ALE
vim.g.ale_linters_explicit = 1
vim.g.ale_completion_delay = 500
vim.g.ale_echo_delay = 20
vim.g.ale_lint_delay = 500
vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
vim.g.ale_lint_on_text_changed = 'normal'
vim.g.ale_lint_on_insert_leave = 1
vim.g.ale_c_gcc_options = '-Wall -O2 -std=c99'
vim.g.ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
vim.g.ale_c_cppcheck_options = ''
vim.g.ale_cpp_cppcheck_options = ''


require('core.gui')
require('core.plugins')
require('core.keymaps')

-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins/
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1

require('core.theme')

-- languages
require('configs.treesitter').config()
-- git
require('configs.git').config()
-- cmp
require('configs.autocomplete').config()
-- search
require('configs.search').config()
-- lsp golang
require('configs.lsp_golang')
-- lsp rust
require('configs.lsp_rust')
