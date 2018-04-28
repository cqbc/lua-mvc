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
    ["220.181.29.116"] = true,

    --[[
      newsclient ip
    ]] --
    ["220.181.102.177"] = true,
    ["220.181.102.176"] = true,
    ["220.181.29.143"] = true,
    ["220.181.29.145"] = true,
    ["61.135.251.105"] = true,
    ["123.126.62.120"] = true,
    ["123.126.62.178"] = true,
    ["220.181.29.247"] = true,
    ["220.181.29.249"] = true,
    ["220.181.29.83"] = true,
    ["220.181.98.189"] = true,
    ["220.181.98.191"] = true,
    ["220.181.98.190"] = true,
    ["61.135.253.34"] = true,
    ["61.135.253.35"] = true,
    ["223.252.218.196"] = true,

    --[[
      爱玩APP
    --]]
    ["106.2.39.206"] = true,
    ["123.58.165.85"] = true,

    --[[
      bj tuijian ibc=bjrec
    ]] --
    ["59.111.32.251"] = true,
    ["223.252.202.51"] = true,
    ["59.111.32.13"] = true,

    --[[
      hzxieyufeng@corp.netease.com
    ]] --
    ["115.236.125.98"] = true,
    ["115.236.125.99"] = true,
    ["115.236.125.100"] = true,
    ["115.236.125.17"] = true,
    ["115.236.125.106"] = true,
    ["115.236.125.107"] = true,
    ["115.236.125.156"] = true,
    ["106.2.36.222"] = true,
    ["123.58.180.115"] = true,
    ["59.111.32.251"] = true,
    ["106.2.36.223"] = true,
    ["123.58.180.116"] = true,
    ["115.236.125.50"] = true,
    ["114.113.197.131"] = true,
    ["114.113.197.132"] = true,
    ["115.236.125.17"] = true,

    --[[
      lixiucheng@corp.netease.com
    ]] --
    ["106.2.124.188"] = true,
    ["106.2.124.189"] = true,
    ["106.2.124.191"] = true,
    ["106.2.124.190"] = true,
    ["59.111.32.12"] = true,
    ["123.58.179.251"] = true,
    ["106.2.44.185"] = true,
    ["106.2.44.186"] = true,

    --[[
      bjchaijinqiu@corp.netease.com
    ]] --
    ["106.2.32.224"] = true,

    --[[
      bjlvsichen@corp.netease.com
    ]] --
    ["10.160.247.71"] = true,
    ["59.111.160.15"] = true,
    ["59.111.160.16"] = true,

    --[[
      sport liv: bjxiongwenjia@corp.netease.com
    ]] --
    ["220.181.102.101"] = true,
    ["106.38.231.63"] = true,
    ["106.38.231.30"] = true,
    ["123.126.62.164"] = true,
    ["123.125.51.229"] = true,

    --[[
      客户端后台
    ]] --
    ["223.252.218.193"] = true,
    ["223.252.218.194"] = true,
    ["223.252.218.195"] = true,
    ["223.252.218.196"] = true,
    ["223.252.218.197"] = true,
    ["223.252.218.198"] = true,
    ["223.252.218.199"] = true,
    ["223.252.218.200"] = true,
    ["223.252.218.201"] = true,
    ["223.252.218.202"] = true,
    ["223.252.218.203"] = true,
    ["223.252.218.204"] = true,
    ["223.252.218.205"] = true,
    ["223.252.218.206"] = true,
    ["223.252.218.207"] = true,
    ["223.252.218.208"] = true,
    ["223.252.218.209"] = true,
    ["223.252.218.210"] = true,
    ["223.252.218.211"] = true,
    ["223.252.218.212"] = true,
    ["223.252.218.213"] = true,
    ["223.252.218.214"] = true,
    ["223.252.218.215"] = true,
    ["223.252.218.216"] = true,
    ["223.252.218.217"] = true,
    ["223.252.218.218"] = true,
    ["223.252.218.219"] = true,
    ["223.252.218.220"] = true,
    ["223.252.218.221"] = true,
    ["223.252.218.222"] = true,
    ["223.252.202.119"] = true,
    ["223.252.202.120"] = true,
    ["10.112.184.154"] = true,
    ["10.112.184.155"] = true,
    ["10.112.184.156"] = true,
    ["10.102.189.94"] = true,
    ["10.102.189.82"] = true,
    ["10.102.189.83"] = true,
    ["10.112.184.150"] = true,
    ["10.112.184.151"] = true,
    ["10.102.189.89"] = true,
    ["10.102.189.88"] = true,
    ["10.112.184.167"] = true,

    --[[
      recommond americ
     ]] --
    ["59.111.160.21"] = true,
    ["59.111.160.22"] = true,
    ["59.111.160.103"] = true,

    --[[
      pre env
    ]] --
    ["10.122.139.23"] = true,
    ["61.135.255.86"] = true,

    --[[
      网易号
    ]] --
    ["123.126.94.246"] = true,
    ["106.38.230.183"] = true,
    ["123.126.94.140"] = true,
    ["106.38.230.181"] = true,

    --[[
      智子项目智能投放广告
    ]] --
    ["10.200.130.92"] = true,
    ["10.201.240.253"] = true,
}

return IPWhiteList;