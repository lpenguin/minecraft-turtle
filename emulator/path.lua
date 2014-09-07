local turtle = nil



local dir = {}
local pos = {}

local xmods = {1, 0, -1, 0}
local ymods = {0, -1, 0, 1}
local modsIndex = 0
function mod(a, b)
    return a - (math.floor(a/b)*b)
end

function inc(value, max)
    value = value + 1
    return mod(value, max)
end

function dec(value, max)
    value = value - 1
    if value >= 0 then
        return mod(value, max)
    else
        return mod(value, max)
    end
end

function right()
    turtle.turnRight()
    modsIndex = inc(modsIndex, 4)
    local xdir = xmods[modsIndex+1]
    local ydir = ymods[modsIndex+1]
    dir = {x=xdir; y=ydir;z=dir.z}
end

function left()
    turtle.turnLeft()
    modsIndex = dec(modsIndex, 4)
    local xdir = xmods[modsIndex+1]
    local ydir = ymods[modsIndex+1]
    dir = {x=xdir; y=ydir;z=dir.z}
end

function set_turtle(turtle1)
    turtle = turtle1
end


function reset()
    dir = {x=xmods[1]; y=ymods[1]; z=0}
    pos = {x=0; y=0; z=0}
end

function forward()
    pos = vec_add(pos, dir)
    print("moving in direction: ")
    print_vec(dir)
    print("new pos: ")
    print_vec(pos)
    return turtle.back()
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
    print("rotate t= "..t..", cx= "..cx..", cy= "..cy..", x= "..x..", y="..y)
    if t > 0 then
        print("rotating turtle left")
        left()
    else
        if t < 0 then
            print("rotating turtle right")
            right()
        else 
            print("t==0")
            if cx*x + cy*y < 0 then
                print("other sides")
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
        print("move dz")
        if pos.z > coords.z then

            local r = down()
            if coords.put then
                turtle.placeUp()
            end
            return r
        else
            local r = up()
            if coords.put then
                turtle.placeDown()
            end
            return r
        end       
    end



    if dx ~= 0 then
        print("move dx")
        rotate(dir.x, dir.y, dx, 0)
        local r = forward()
        if coords.put then
            turtle.place()
        end
        return r
    end

    if dy ~= 0 then
        print("move dy")
        rotate(dir.x, dir.y, 0, dy)
        local r = forward()
        if coords.put then
            turtle.place()
        end
        return r
    end

    return false
end 

function move_to(coords)
    while move_to_iter(coords) do
        print("...")
    end   
end

function move(postitions)
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

