-- http://pastebin.com/BeGCtnrz

local dirname=function(str,sep)
    sep=sep or'/'
    return str:match("(.*"..sep..")")
end

function download(url, dest)
    fs.makeDir(dirname(dest))

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
download(root.."shortcuts/fuel.lua", "shortcuts/fuel")
download(root.."shortcuts/refuel.lua", "shortcuts/refuel")
download(root.."shortcuts/f.lua", "shortcuts/f")
download(root.."shortcuts/b.lua", "shortcuts/b")
download(root.."shortcuts/l.lua", "shortcuts/l")
download(root.."shortcuts/r.lua", "shortcuts/r")
download(root.."shortcuts/u.lua", "shortcuts/u")
download(root.."shortcuts/d.lua", "shortcuts/d")
download(root.."modules/path.lua", "modules/path")
download(root.."modules/utils.lua", "modules/utils")
download(root.."camp.lua", "camp")
download(root.."testpath.lua", "testpath")

