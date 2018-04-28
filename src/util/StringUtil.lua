--
-- Created by IntelliJ IDEA.
-- User: bjlizhitao
-- Date: 2018/4/17
-- Time: 10:54
-- To change this template use File | Settings | File Templates.
-- 字符串工具类

local StringUtil = {}

function StringUtil.split(str, splitter)
    if not str or str == "" or not splitter then
        return nil
    end

    local result = {}
    for match in (str .. splitter):gmatch("(.-)" .. splitter) do
        table.insert(result, match)
    end

    return result
end

function StringUtil.format(message)
    message = string.gsub(message, "\n", "")
    message = string.gsub(message, "%c", "")
    message = string.gsub(message, "\r", "")
    return message
end

return StringUtil;