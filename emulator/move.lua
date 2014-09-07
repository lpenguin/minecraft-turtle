local turtle = require "turtle"
local path = require "path"
local Area = require "area"
local utils = require "utils"
local v = utils.v
local p = utils.p
local field = Area.Area.new(9, 9, 3)

turtle.setArea(field)
turtle.setPosition(5, 5, 1)
turtle.turnLeft()
turtle.turnLeft()

path.setTurtle(turtle)
path.reset()

-- utils.printArea(field)
-- path.move({v(0, 0, 2)})
path.move({
    p(4, 0, 0), 
    p(4, 3, 0),
    p(0, 3, 0),
    p(0, 1, 0),


    v(0, 1, 1),
    v(0, 2, 1),
    p(0, 3, 1),
    p(4, 3, 1),
    p(4, 0, 1), 
    p(-1, 0, 1),

    v(-1, 0, 2),
    v(0, 0, 2),
    p(4, 0, 2),
    p(4, 3, 2),
    p(0, 3, 2),
    p(0, 1, 2),
    p(3, 1, 2),
    p(3, 2, 2),
    p(1, 2, 2),
    p(1, 2, 1),

    })
utils.printArea(field)


