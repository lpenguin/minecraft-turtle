local Area = require "area"
local utils = require "utils"
local turtle = require "turtle"
local inspect = require "inspect"

local field = Area.Area.new(20, 20, 2)

turtle.setArea(field)
turtle.setPosition(8, 9, 1)


function move()
    if turtle.detect() then
        turtle.dig()
    end
    turtle.forward()
    utils.printArea(field)
end

function down()
    if turtle.detectDown() then
        turtle.digDown()
    end
    turtle.down()
    -- utils.printArea(field)
end

function rot(rotLeft)
    if rotLeft then
        turtle.left()
    else
        turtle.right()
    end
end

function digLine(length)
    for i=1,length-1 do
        move()
    end
end

function digLevel(width, height, rotLeft)
    local isEven = utils.mod(width, 2) == 0
    for i=1, width-1 do
        digLine(height)
        rot(rotLeft)
        move()
        rot(rotLeft)
        rotLeft = not rotLeft
    end
    
    
    digLine(height)
end

function dig(width, height, level)
    r = false
    for i=1,level do
        print(inspect(turtle.direction()))
        digLevel(width, height, r)
        turtle.left()
        turtle.left()
        if not (i == level) then
            down()
        end
        r = not r
    end

    for i=1, level-1 do
        turtle.up()
    end
end


turtle.left()

dig(1, 5, 2)
utils.printArea(field)

-- turtle.left()
-- move()
-- move()
-- move()
-- turtle.left()
-- move()
-- move()
-- move()

