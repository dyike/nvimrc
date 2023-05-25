local _M = {}

local c = require("vscode.colors").get_colors()
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
        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
            -- this supports the same val table as vim.api.nvim_set_hl
            -- use colors from this colorscheme by requiring vscode.colors!
            Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
        }
    })
    require('vscode').load()
end

return _M
