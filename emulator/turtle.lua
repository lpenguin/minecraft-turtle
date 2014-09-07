local utils = require "utils"
local mod = utils.mod
local inc = utils.inc
local dec = utils.dec

local x = 1
local y = 1
local z = 1

local xmods = {1, 0, -1, 0}
local ymods = {0, -1, 0, 1}

local xdir = xmods[1]
local ydir = ymods[1]

local modsIndex = 0
local area = nil 
local fuel = 1000
local selectedSlot = 0

function select(slot)
    selectedSlot = slot
end

function getSelectedSlot( )
    return selectedSlot
end

function getItemCount(  )
    return 1
end

function setArea(area1)
    area = area1
end

function setPosition(x1, y1, z1)
    area:setEmpty(x, y, z)
    x = x1
    y = y1
    z = z1
    area:setTurtle(x, y, z)
end

function place()
    newx = x + xdir
    newy = y + ydir
    area:setFilled(newx, newy, z)
end

function placeUp()
    area:setFilled(x, y, z + 1)
end

function placeDown()
    area:setFilled(x, y, z - 1)
end

function getPosition()
    return {x=x, y=y, z=z}
end

function forward()
    fuel = fuel - 1
    newx = x + xdir
    newy = y + ydir
    if area:isEmpty(newx, newy, z) then
        setPosition(newx, newy, z)
        return true
    end
    return false
end

function back()
    fuel = fuel - 1
    newx = x - xdir
    newy = y - ydir
    if area:isEmpty(newx, newy, z) then
        setPosition(newx, newy, z)
        return true
    end
    return false
end

function detect()
    newx = x + xdir
    newy = y + ydir
    return not area:isEmpty(newx, newy, z)
end

function detectDown()
    newz = z + 1
    return not area:isEmpty(x, y, newz)
end

function detectUp()
    newz = z - 1
    return not area:isEmpty(x, y, newz)
end

function digDown()
    newz = z - 1
    area:setEmpty(x, y, newz)
end

function dig()
    newx = x + xdir
    newy = y + ydir
    area:setEmpty(newx, newy, z)
end


function down()
    fuel = fuel - 1
    newz = z - 1
    if area:isEmpty(x, y, newz) then
        setPosition(x, y, newz)
        return true
    end
    return false
end

function up()
    fuel = fuel - 1
    newz = z + 1
    if area:isEmpty(x, y, newz) then
        setPosition(x, y, newz)
        return true
    end
    return false
end


function right()
    modsIndex = inc(modsIndex, 4)

    xdir = xmods[modsIndex+1]
    ydir = ymods[modsIndex+1]
end

function left()
    modsIndex = dec(modsIndex, 4)
    xdir = xmods[modsIndex+1]
    ydir = ymods[modsIndex+1]
end

function direction()
    return {x = xdir, y = ydir}
end

function getFuelLevel( )
    return fuel
end

return {
    setPosition = setPosition;
    getPosition = getPosition;
    setArea = setArea;
    direction = direction;
    turnLeft = left;
    turnRight = right;
    forward = forward;
    detect = detect;
    detectDown = detectDown;
    dig = dig;
    digDown = digDown;
    down = down;
    up = up;
    detectUp = detectUp;
    back = back;
    place=place;
    placeDown = placeDown;
    placeUp = placeUp;
    getFuelLevel = getFuelLevel;
    getItemCount = getItemCount;
    select = select;
    getSelectedSlot = getSelectedSlot;
}