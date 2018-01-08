# lua-mvc
使用 lua 实现的 mvc 框架，简化 lua 开发

## 一、使用范例
### 1、配置 nginx
#### 将所有需要 lua 处理的接口交给 app:run() 方法运行，如下 content_by_lua：
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
    
### 3、编写 TestController.lua 脚本，路径为 controller 文件夹下，函数名为 test
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
    
### 二、API 介绍
#### 1、Request 对象
* request:new() 创建 Request 对象
* request:getMethod() 获取 HTTP Method
* request:getHeaders() 获取 HTTP 请求头
* request:getHeader(name) 获取指定的请求头
* request:getRawHeader() 获取原生未处理过的 header
* request:setParameter(name, value) 设置请求参数
* request:getParameters() 获取全部请求参数
* request:getParameter(name)() 获取指定请求参数
* request:setAttribute(name, value) 设置请求属性
* request:getAttribute(name) 获取请求属性
* request:getHttpVersion() 获取请求的 http 版本
* request:getRequestURI() 获取请求的 uri
* request:getURI() 获取 uri
* request:getBodyData() 获取 body

#### 2、Response 对象
* response:new() 创建 Response 对象
* response:write(...) 输出数据，Content-Type 为 default_type
* response:writeTxt(...) 输出文本数据，Content-Type 为 text/plain;charset=utf-8
* response:writeJsonTxt(...) 输出 json 数据，不调用 json.encode() 方法，Content-Type 为 application/json;charset=utf-8
* response:writeJson(...) 输出 json 数据，调用 json.encode() 方法，Content-Type 为 application/json;charset=utf-8
* response:sendOK() 返回 200 正确码，不返回数据
* response:sendError(httpStatus) 返回指定的 httpStatus 错误码
* response:sendRedirect(location) 重定向到 location 地址
* response:setHeader(name, value) 设置 header
