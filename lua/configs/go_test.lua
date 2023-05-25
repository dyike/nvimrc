local _M = {}

function _M.run_test()
    local cur_func_name = _M.get_func_name_at_cursor()
    if cur_func_name ~= '' then
        return _M.func_test(cur_func_name)
    end
    return _M.all_test()
end

function _M.func_test(name)
    local cur_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
    local output = vim.fn.system('cd '..cur_path..';'..'go test -v -run '..name)
    return _M.show_result(output)
end

function _M.all_test()
    local cur_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":h")
    local output = vim.fn.system('cd '..cur_path..';'..'go test -v')
    return _M.show_result(output)
end

function _M.show_result(res)
    -- 输出显示在quickfix窗口
    vim.fn.setqflist({}, 'r', {
        title = "Go Tests",
        lines = vim.split(res, '\n'),
        efm = '%f:%l:%c:%m',
    })
    -- 打开quickfix窗口
    vim.cmd('copen')
end

function _M.get_func_name_at_cursor()
    local line_num = vim.fn.line('.')
    for idx = 0, line_num do
        local line = vim.fn.getline(line_num - idx)
        local test_name = string.match(line, "^func%s+Test.*%(")
        if test_name then
            return string.sub(test_name, 6, -2)
        end
        if string.match(line, "^func") == nil then
            return ""
        end
        if idx > 0 and string.match(line, "^}%s*$") == nil then
            return ""
        end
    end
end

return _M