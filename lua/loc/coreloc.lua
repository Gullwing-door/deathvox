local english = Idstring("english"):key() == SystemInfo:language():key()
local korean = Idstring("korean"):key() == SystemInfo:language():key()

if english then
    dofile(ModPath .. "lua/loc/loc.lua")
elseif korean then
    dofile(ModPath .. "lua/loc/locko.lua")
else
    dofile(ModPath .. "lua/loc/loc.lua")
end
