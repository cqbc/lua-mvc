--
-- Created by IntelliJ IDEA.
-- User: lizhitao
-- Date: 2018/1/8
-- Time: 下午12:55
-- To change this template use File | Settings | File Templates.
--
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
