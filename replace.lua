local args = {...}

os.loadAPI("modules/path")
os.loadAPI("modules/utils")

local r = utils.r


path.reset()
path.move({
    r(args[1], 0, 0)
    })
