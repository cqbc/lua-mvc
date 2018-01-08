# lua-mvc
使用 lua 实现的 mvc 框架，简化 lua 开发

## 使用方法
### 1、配置 nginx
#### 将所有需要 lua 处理的接口交给 app:run() 方法运行，如下：
    location ~ ^/api/test/param1/(.*)/param2/(.*) {
        default_type 'application/json;charset=utf-8';
        content_by_lua '
            local app = require("Application")
            app:run()
        ';
    }
    
### 2、配置 Application.lua
#### 添加请求映射，在 initRequestMapping() 函数中添加路径映射，参数分别为 (接口 url，函数名称，lua 文件位置)
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
    
### 3、编写 TestController 脚本
    local TestController
    
    function TestController.test(request, response)
        local param1 = request.getParameter('param1')
        local param2 = request.getParameter('param2')
    
        local result = {
            param1 = param1,
            param2 = param2,
        }
    
        response:writeJson(result);
    end
    
    return TestController
    
