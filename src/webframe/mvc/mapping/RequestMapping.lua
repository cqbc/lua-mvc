--
-- Created by IntelliJ IDEA.
-- User: lizhitao
-- Date: 2017/6/20
-- Time: 下午4:23
-- To change this template use File | Settings | File Templates.
--
local RequestMethod = require('src.webframe.mvc.mapping.RequestMethod')
local gsub = ngx.re.gsub
local requestMapping = {}

requestMapping.mapping = {}

function requestMapping.GET(path, func, filePath)
    requestMapping.addMapping(path, func, RequestMethod.GET, filePath)
end

function requestMapping.POST(path, func, filePath)
    requestMapping.addMapping(path, func, RequestMethod.POST, filePath)
end

function requestMapping.DELETE(path, func, filePath)
    requestMapping.addMapping(path, func, RequestMethod.DELETE, filePath)
end

function requestMapping.getMapping()
    return requestMapping.mapping;
end

-- 解析 pathVariable
local function resolvePathVariable(path)
    local pathVariables = {}
    local regPath = gsub(path, '{[a-zA-Z0-9_]+}', function(s)
        local pathVariable = gsub(s[0], '[{}]', '')
        table.insert(pathVariables, pathVariable)
        return '([a-zA-Z0-9_]+)';
    end)

    return regPath, pathVariables
end

function requestMapping.addMapping(path, func, requestMethod, filePath)
    path = '^' .. path .. '$'
    local regPath, pathVariables = resolvePathVariable(path)

    table.insert(requestMapping.mapping, {
        ['path'] = path,
        ['func'] = func,
        ['requestMethod'] = requestMethod,
        ['filePath'] = filePath,
        ['regPath'] = regPath,
        ['pathVariables'] = pathVariables
    })
end

return requestMapping;

