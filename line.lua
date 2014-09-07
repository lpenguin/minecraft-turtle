local args = {...}

os.loadAPI("modules/path")
os.loadAPI("modules/utils")

local p = utils.p
local v = utils.v
local d = utils.d

path.reset()
path.move({
    p(args[1], 0, 0)
    })

