--
-- Created by IntelliJ IDEA.
-- User: lizhitao
-- Date: 2017/6/20
-- Time: 下午5:58
-- To change this template use File | Settings | File Templates.
--
local mappingResolver = require('resty.webframe.mvc.mapping.MappingResolver')
local Request = require('resty.webframe.http.Request')
local Response = require('resty.webframe.http.Response')
local invoker = require('resty.webframe.mvc.invoker.FunctionInvoker')
local HttpStatus = require('resty.webframe.http.HttpStatus')

local dispatcher = {}

-- 执行请求分发
local function doDispatch(mappingFunc, matchMapping, request, response)
    local success = invoker.invokeFunction(mappingFunc, matchMapping, request, response) -- 执行函数调用

    if not success then -- 执行函数失败
        -- 函数执行失败返回 500
        response:sendError(HttpStatus.SC_INTERNAL_SERVER_ERROR)
    end
end

-- 请求分发
function dispatcher.dispatch(mappings)
    local request = Request:new()
    local response = Response:new()
    local mappingFunc, matchMapping = mappingResolver.resolve(request, mappings)

    if mappingFunc then -- 找到控制器映射的函数，执行请求分发
        doDispatch(mappingFunc, matchMapping, request, response)
    else
        -- 未找到控制器映射的函数返回 404
        response:sendError(HttpStatus.SC_NOT_FOUND)
    end
end

return dispatcher

