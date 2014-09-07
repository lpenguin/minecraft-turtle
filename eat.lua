local args = {...}

os.loadAPI("modules/path")
os.loadAPI("modules/utils")

local p = utils.p
local e = utils.e
local v = utils.v
local d = utils.d

path.reset()
path.move({
    e(args[1], 0, 0)
    })

