local _M = {}

local c = require("vscode.colors")

function _M.config()
    require('vscode').setup({
        -- 允许透明背景
        transparent = true,
        -- 注释使用斜体
        italic_comments = true,
        -- 禁止使用nvim-tree 背景色
        disable_nvimtree_bg = true,
        -- 重写部分元素配色
        color_overrides = {
            vscLineNumber = '#FFCC33',
        },
    })
end

return _M
