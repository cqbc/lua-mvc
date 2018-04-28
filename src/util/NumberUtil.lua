--
-- Created by IntelliJ IDEA.
-- User: bjlizhitao
-- Date: 2018/4/17
-- Time: 15:29
-- To change this template use File | Settings | File Templates.
--

local NumberUtil = {
    MAX_INT_VALUE = 0x7fffffff,
}

function NumberUtil.getNumber(number, defalutValue)
    if number and pcall(tonumber, number) then
        return number
    else
        if defalutValue and pcall(tonumber, defalutValue) then
            return defalutValue
        else
            return 0
        end
    end
end

return NumberUtil