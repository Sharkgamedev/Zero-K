-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------

function widget:GetInfo()
    return {
      name      = "Airpad Excluder",
      desc      = "Handler for exclude airpads gadget.",
      author    = "SharkGameDev",
      date      = "2020-09-26",
      license   = "PD",
      handler   = true,
      layer     = 0,
      enabled   = true,
    }
end

VFS.Include("LuaRules/Configs/customcmds.h.lua")

local function findUnitUnderCursour (cmdParams) 
    local mouseX,mouseY = cmdParams[1], cmdParams[2]
    Spring.Echo("cmd x: " .. mouseX .. " y: " .. mouseY)
    local bmouseX, bmouseY = Spring.GetMouseState()
    Spring.Echo("spring x: " .. bmouseX .. " y: " .. bmouseY)
	local type, id = Spring.TraceScreenRay(mouseX, mouseY, false)
	if type == "unit" then
		Spring.SendLuaRulesMsg('addExclusion|' .. id)
	end
end

function widget:CommandNotify(cmdID, cmdParams, cmdOptions)
    if cmdID == CMD_EXCLUDEAIRPAD then
        findUnitUnderCursour(cmdParams)
        return true,true
    end
    return false -- command not used
end
