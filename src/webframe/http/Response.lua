--
-- Created by IntelliJ IDEA.
-- User: lizhitao
-- Date: 2017/6/20
-- Time: 下午4:20
--
local json = require('cjson')
local Response = {}

Response.version = '0.0.1'

function Response:new()
    local instance = {
        say = ngx.say,
        exit = ngx.exit,
        redirect = ngx.redirect,
        header = ngx.header,
    }

    setmetatable(instance, { __index = self })

    return instance
end

function Response:write(...)
    self.say(...)
end

-- 写纯文本数据 Content-Type: text/plain
function Response:writeTxt(...)
    self:setHeader('Content-Type', 'text/plain;charset=utf-8')
    self.say(...)
end

-- 写纯文本数据 Content-Type: application/json
function Response:writeJsonTxt(...)
    self:setHeader('Content-Type', 'application/json;charset=utf-8')
    self.say(...)
end

-- 写 json 数据 Content-Type: application/json
function Response:writeJson(object)
    self:setHeader('Content-Type', 'application/json;charset=utf-8')
    local jsonStr = json.encode(object)
    self.say(jsonStr)
end

function Response:sendOK()
    self.exit(ngx.HTTP_OK)
end

function Response:sendStatus(httpStatus)
    ngx.status = httpStatus.code
    self:writeJson({ code = httpStatus.code, codeMsg = httpStatus.codeMsg })
    self.exit(ngx.HTTP_OK)
end

function Response:sendRedirect(location)
    self.redirect(location)
end

function Response:setHeader(name, value)
    self.header[name] = value
end

return Response

