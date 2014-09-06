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

download(root.."utils.lua", "utils")
download(root.."path.lua", "path")
download(root.."move-mc.lua", "move")