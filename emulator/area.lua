local Area = {}
Area.__index = Area

local empty = 0
local filled = 1
local turtle = 2

function Area.new(width, height, level)
    local self = setmetatable({}, Area)
    self.width = width
    self.height = height
    self.level = level
    self.area = {}
    for i=1, width do
        self.area[i] = {}
        for j=1, height do
            self.area[i][j] = {}
            for k=1, level do
                self.area[i][j][k] = filled
            end
        end
    end
    return self
end
function Area.setTurtle(self, x, y, z)
    self.area[x][y][z] = turtle
end
function Area.set(self, x, y, z, value)
    self.area[x][y][z] = value
end

function Area.setEmpty(self, x, y, z)
    self.area[x][y][z] = empty
end

function Area.setFilled(self, x, y, z)
    self.area[x][y][z] = filled
end

function Area.value(self, x, y, z)
    return self.area[x][y][z]
end

function Area.isEmpty(self, x, y, z)
    return self.area[x][y][z] == empty
end

function Area.isTurtle(self, x, y, z)
    return self.area[x][y][z] == turtle
end

return {
    Area = Area;
}

