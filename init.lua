-- http://pastebin.com/BeGCtnrz

function download(url, dest)
    local gist_url = url
    local request = http.get( gist_url )
    local response = request.readAll()
    request.close()
    local file = fs.open( dest, "w" )
    file.write( response )
    file.close()
end

local root = "https://raw.githubusercontent.com/lpenguin/minecraft-turtle/master/"

download(root.."init.lua", "init")
download(root.."fuel.lua", "fuel")
download(root.."refuel.lua", "refuel")
download(root.."move-mc.lua", "move")
download(root.."f.lua", "f")
download(root.."f.lua", "f")
