os.loadAPI("modules/path")
os.loadAPI("modules/utils")

local p = utils.p
local v = utils.v

path.reset()

path.move({
    p(4, 0, 0), 
    p(4, 3, 0),
    p(0, 3, 0),
    p(0, 1, 0),

    v(0, 0, 1), 
    p(4, 3, 1),
    p(0, 3, 1),
    p(0, 1, 1),


    v(0, 0, 2), 
    p(4, 0, 2),
    p(4, 1, 2),
    p(0, 1, 2),
    p(0, 2, 2),
    p(4, 2, 2),
    p(4, 3, 2),
    p(-1, 3, 2),
    v(-1, 0, 0)
    })

print("hi")