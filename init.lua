-- http://pastebin.com/BeGCtnrz

local dirname=function(str,sep)
    sep=sep or'/'
    return str:match("(.*"..sep..")") or "."
end

function download(url, dest)
    print("downloading into: "..dest.." "..url)
    print("creating directory: "..dirname(dest))
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
download(root.."shortcuts/fuel.lua", "s/fuel")
download(root.."shortcuts/refuel.lua", "s/refuel")
download(root.."shortcuts/f.lua", "s/f")
download(root.."shortcuts/b.lua", "s/b")
download(root.."shortcuts/l.lua", "s/l")
download(root.."shortcuts/r.lua", "s/r")
download(root.."shortcuts/u.lua", "s/u")
download(root.."shortcuts/d.lua", "s/d")
download(root.."modules/path.lua", "modules/path")
download(root.."modules/utils.lua", "modules/utils")
download(root.."camp.lua", "camp")
download(root.."decamp.lua", "decamp")
download(root.."testpath.lua", "testpath")

