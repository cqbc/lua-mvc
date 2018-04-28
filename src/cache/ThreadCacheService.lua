--
-- Created by IntelliJ IDEA.
-- User: bjlizhitao
-- Date: 2017/12/1
-- Time: 17:32
-- To change this template use File | Settings | File Templates.
--

local ThreadType = require "util.enums.ThreadType"
local redisCluster = require "cache.core.RedisCluster"
local config = require "util.Config"
local redisConfig = config.getConfig().redisConfig

local needConvertToNumberFields = {
    againstcount = true,
    code = true,
    prcount = true,
    ptcount = true,
    threadAgainst = true,
    threadVote = true,
    votecount = true,
    bored = true,
    boredWeight = true,
    enjoy = true,
    enjoyWeight = true,
    laugh = true,
    laughWeight = true
}


local threadCacheService = {}

-- 获取跟贴数 cacheKey
local function getCacheKey(docId)
    return 'threadServiceCacheKey_' .. docId
end

-- 从 redis cluster 中获取跟贴数信息
function threadCacheService.getThreadInfoFromCache(docId, threadType)
    -- redis 缓存 key
    local cacheKey = getCacheKey(docId)
    local red = redisCluster:new(redisConfig)

    -- 跟贴数信息返回值
    local threadMap
    local result = red:hgetall(cacheKey)

    if result and tostring(result) ~= "userdata: NULL" and next(result) ~= nil then
        threadMap = {}
        for k, v in pairs(result) do
            if k % 2 == 1 then
                if threadType ~= nil and threadType == ThreadType.duanzi.type then
                    local value = result[k + 1]

                    if needConvertToNumberFields[v] then
                        if value ~= nil and value ~= 'null' then
                            threadMap[v] = tonumber(value)
                        end
                    else
                        threadMap[v] = value
                    end
                else
                    -- 非段子类型主贴过滤段子的字段值
                    if not ThreadType.duanzi.fields[v] then
                        local value = result[k + 1]

                        if needConvertToNumberFields[v] then
                            if value ~= nil and value ~= 'null' then
                                threadMap[v] = tonumber(value)
                            end
                        else
                            threadMap[v] = value
                        end
                    end
                end
            end
        end
    end

    red:close()

    return threadMap
end

-- 处理未被缓存的 docIds
local function dealNotCacheDocIds(docIds, threadType, batGetResult, batchResults)
    -- 未被缓存的 docId 集合
    local missCacheDocIds = {}
    for idx, threadInfo in pairs(batchResults) do
        if table.getn(threadInfo) > 0 then
            local threadMap = {}
            for k, v in pairs(threadInfo) do
                if k % 2 == 1 then
                    if threadType ~= nil and threadType == ThreadType.duanzi.type then
                        local value = threadInfo[k + 1]

                        if needConvertToNumberFields[v] then
                            if value ~= nil and value ~= 'null' then
                                threadMap[v] = tonumber(value)
                            end
                        else
                            threadMap[v] = value
                        end
                    else
                        -- 非段子类型主贴过滤段子的字段值
                        if not ThreadType.duanzi.fields[v] then
                            local value = threadInfo[k + 1]

                            if needConvertToNumberFields[v] then
                                if value ~= nil and value ~= 'null' then
                                    threadMap[v] = tonumber(value)
                                end
                            else
                                threadMap[v] = value
                            end
                        end
                    end
                end
            end
            batGetResult.add(docIds[idx], threadMap)
        else
            table.insert(missCacheDocIds, docIds[idx])
        end
    end

    return missCacheDocIds
end

-- 批量获取跟贴数缓存并返回未被缓存的 docIds
function threadCacheService.batchGetThreadInfoFromCache(docIds, threadType, batGetResult)
    local red = redisCluster:new(redisConfig)

    red:init_pipeline()

    for n = 1, #docIds do
        local docId = docIds[n]
        if docId then
            -- redis 缓存 key
            local cacheKey = getCacheKey(docId)
            red:hgetall(cacheKey)
        end
    end

    local batchResults = red:commit_pipeline()
    red:close()

    return dealNotCacheDocIds(docIds, threadType, batGetResult, batchResults)
end

return threadCacheService