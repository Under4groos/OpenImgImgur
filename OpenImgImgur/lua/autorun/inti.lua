




AddCSLuaFile()
AddCSLuaFile("client/cl_lib.lua") 
AddCSLuaFile("client/cl_inti.lua") 
if CLIENT then
    include("client/cl_lib.lua")
    include("client/cl_inti.lua")
end