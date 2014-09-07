os.loadAPI("modules/path")
os.loadAPI("modules/utils")

local p = utils.p
local v = utils.v
local d = utils.d

turtle.turnLeft()

path.reset()
path.move({
    d(4, 0, 0),
    d(4, 1, 0),
    d(0, 1, 0),
    d(0, 2, 0),
    d(4, 2, 0),
    d(4, 3, 0),
    d(0, 3, 0),
    d(0, 0, 0),

    d(0, 0, -1), 
    d(4, 3, -1),
    d(0, 3, -1),
    d(0, 1, -1),
    v(0, 0, -1),

    d(0, 0, -2), 
    d(4, 3, -2),
    d(0, 3, -2),
    d(0, 1, -2),
    v(0, 0, -2),
    })