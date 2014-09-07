local dirname=function(str,sep)
    sep=sep or'/'
    return str:match("(.*"..sep..")")
end

local filename=function(str)
    local r = str:match(".*/(.*)")
    if r == nil then
        return str
    else
        return r
    end
end

local root = dirname(arg[0])

package.path = package.path .. ";"..root.."?.lua"..";"..root.."/../modules/?.lua"

_G.turtle = require(root.."/turtle")
_G["os"] = {
    loadAPI = function(path)
        local name = filename(path)
        _G[name] = require(path)
    end
}
local Area = require(root.."/area")
local utils = require("utils")

local field = Area.Area.new(9, 9, 4)

turtle.setArea(field)
turtle.setPosition(5, 5, 1)

require(arg[1])
utils.printArea(field)
