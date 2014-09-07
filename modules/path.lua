print("Loaded path module")
os.loadAPI("modules/utils")

local dir = {}
local pos = {}

local xmods = {1, 0, -1, 0}
local ymods = {0, -1, 0, 1}
local modsIndex = 0

function right()
    turtle.turnRight()
    modsIndex = utils.inc(modsIndex, 4)
    local xdir = xmods[modsIndex+1]
    local ydir = ymods[modsIndex+1]
    dir = {x=xdir; y=ydir;z=dir.z}
end

function left()
    turtle.turnLeft()
    modsIndex = utils.dec(modsIndex, 4)
    local xdir = xmods[modsIndex+1]
    local ydir = ymods[modsIndex+1]
    dir = {x=xdir; y=ydir;z=dir.z}
end

function reset()
    dir = {x=xmods[1]; y=ymods[1]; z=0}
    pos = {x=0; y=0; z=0}
end

function forward()
    pos = vec_add(pos, dir)
    return turtle.forward()
end



function up()
    pos = vec_add(pos, {x=0; y=0; z=1})
    return turtle.up()
end

function down()
    pos = vec_add(pos, {x=0; y=0; z=-1})
    return turtle.down()
end

function rotate(cx, cy, x, y)
    t = cx * y - cy * x
    if t > 0 then
        left()
    else
        if t < 0 then
            right()
        else 
            if cx*x + cy*y < 0 then
                left()
                left()
            end
        end
    end
end

function print_vec(vec)
    print("x: "..vec.x..", y: "..vec.y..", z: "..vec.z)
end

function vec_add(vec1, vec2)
    return {x = vec1.x + vec2.x; 
            y = vec1.y + vec2.y; 
            z = vec1.z + vec2.z; 
            }
end

function vec_eq(vec1, vec2)
    return vec1.x == vec2.x and vec1.y == vec2.y and vec1.z == vec2.z
end

function move_to_iter(coords)
    dx = coords.x - pos.x
    dy = coords.y - pos.y
    dz = coords.z - pos.z

    print("dx: "..dx..", dy: "..dy..", dz: "..dz)

    if pos.z ~= coords.z then
        if pos.z > coords.z then
            if coords.put then
                turtle.placeUp()
            end
            return down()
        else
            if coords.put then
                turtle.placeDown()
            end
            return up()
        end       
    end



    if dx ~= 0 then
        rotate(dir.x, dir.y, dx, 0)
        if coords.put then
            turtle.placeDown()
        end
        return forward()
    end

    if dy ~= 0 then
        rotate(dir.x, dir.y, 0, dy)
        if coords.put then
            turtle.placeDown()
        end 
        return forward()
    end

    return false
end 

function move_to(coords)
    while move_to_iter(coords) do
        print("...")
    end   
end

function move(postitions)
    turtle.up()
    for i, pos in ipairs(postitions)do
        move_to(pos)
    end
end

return {
    moveTo = move_to;
    reset = reset;
    setTurtle = set_turtle;
    move=move;
}

