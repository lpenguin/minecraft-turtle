print("Loaded utils module")
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

function printArea(area)
    for i=1,area.level do
        print("Level #"..i)
        printAreaLevel(area, i)
        print ""
    end
end

function printAreaLevel(area, level)
    str = "   "
    for i =1, area.height do
        str = str..i.." "
    end
    print(str)
    for i=1,area.height do
        local s = i
        if s < 10 then
            s = " "..s
        end
        local str = s.." "
        for j=1,area.width do
            if area:isEmpty(j, i, level) then
                str = str..". "
            else
                if area:isTurtle(j, i, level) then
                    str = str.."O "
                else
                    str = str.."x "
                end
                
            end
        end
        print(str)
    end
end

function v(x, y, z)
    return {x=x; y=y; z=z;}
end

function v2(x, y)
    return v3(x, y, 0)
end

function p(x, y, z)
    return {x=x; y=y; z=z; put=true}
end

function d(x, y, z)
    return {x=x; y=y; z=z; dig=true}
end

function e(x, y, z)
    return {x=x; y=y; z=z; eat=true}
end

return {
    printArea = printArea;
    inc = inc;
    dec = dec;
    mod = mod;
    v = v;
    v2 = v2;
    p = p;
    d = d;
}