--
-- Created by IntelliJ IDEA.
-- User: bjlizhitao
-- Date: 2018/4/17
-- Time: 10:42
-- To change this template use File | Settings | File Templates.
-- 接口访问控制

local ipWhiteList = require('auth.IPWhiteList')
local StringUtil = require('util.StringUtil')
local Request = require('webframe.http.Request')
local Response = require('webframe.http.Response')
local HttpStatus = require('webframe.http.HttpStatus')

local function hasAuth(ipWhiteList, ip)
    return ipWhiteList[ip]
end

local function isValidIP(ipWhiteList)
    local request = Request:new()

    local accessIP = request:getHeader('X-Real-IP')

    if not accessIP then
        accessIP = request:getHeader('X-Forwarded-For')
        if accessIP then
            local ip = StringUtil.split(accessIP, ',')
            accessIP = ip[1]
        end
    end

    if not accessIP then
        accessIP = ngx.var.remote_addr
    end

    if accessIP and hasAuth(ipWhiteList, accessIP) then
        return true
    else
        if accessIP then
            ngx.log(ngx.ERR, "IP is not in IPWhiteList: " .. accessIP)
        end

        return false
    end
end

if not isValidIP(ipWhiteList) then
    local response = Response:new()
    response:sendStatus(HttpStatus['SC_UNAUTHORIZED'])
end