--
-- Created by IntelliJ IDEA.
-- User: bjlizhitao
-- Date: 2018/4/17
-- Time: 10:32
-- To change this template use File | Settings | File Templates.
-- 接口 ip 白名单

local IPWhiteList = {
    --[[
      localhost and test
    ]] --
    ["127.0.0.1"] = true,
}

return IPWhiteList;