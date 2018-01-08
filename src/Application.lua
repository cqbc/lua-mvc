--
-- Created by IntelliJ IDEA.
-- User: lizhitao
-- Date: 2017/6/14
-- Time: 下午5:35
-- mvc 主程序入口
--
local dispatcher = require('src.webframe.mvc.Dispatcher')
local requestMapping = require('src.webframe.mvc.mapping.RequestMapping')
local application = {}

-- 添加请求映射
local function initRequestMapping()
    requestMapping.GET('/api/test/param1/{param1}/param2/{param2}', 'test', 'controller.TestController')
end

initRequestMapping()

function application:run()
    dispatcher.dispatch(requestMapping.getMapping()) -- 分发请求
end

return application
