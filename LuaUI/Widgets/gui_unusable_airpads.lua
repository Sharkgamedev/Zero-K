function widget:GetInfo()
    return {
      name      = "Allied Airpads Exclusion Handler",
      desc      = "UI for marking allied airpads unusable gadget",
      author    = "SharkGameDev",
      date      = "2020-09-10",
      license   = "GNU GPL, v2 or later",
      layer     = 0,
      enabled   = true,
      handler		= true, --for adding customCommand into UI
    }
end
  
--VFS.Include("LuaRules/Configs/customcmds.h.lua")

--local function DummyLayoutHandler(xIcons, yIcons, cmdCount, commands)
--    handler.commands = commands
--    handler.commands.n = cmdCount
  --  handler:CommandsChanged()
    --return "", xIcons, yIcons, {}, {}, {}, {}, {}, {}, {}, {}
--end
--
--function widget:Initialize()--
---	widgetHandler:RegisterGlobal(widget, "Test", DummyLayoutHandler)
--end

--function widget:CommandsChanged()
--	local customCommands = widgetHandler.customCommands

	--Add retreat-area button
--	table.insert(customCommands, {
--		id      = CMD_SETAIRPADEXCLUSION,
--		type    = CMDTYPE.ICON_MAP,
--		tooltip = 'Select an airpad to be exlcuded from the refueling list',
--		cursor  = 'Repair',
--		action  = 'sethaven',
--		params  = { },
--		texture = 'LuaUI/Images/commands/Bold/retreat.png',
--
--		pos = {123},
--	})
--end

local cmdEXCLUDEAIRPAD = {
	id      = CMD_EXCLUDEAIRPAD,
	type    = CMDTYPE.ICON,
	tooltip = 'Excludes an airpad from the fighter running',
	action  = 'reclaim',
	params  = {},
	texture = 'LuaUI/Images/commands/states/divebomb_shield.png',
	pos     = {CMD_ONOFF,CMD_REPEAT,CMD_MOVE_STATE,CMD_FIRE_STATE, CMD_RETREAT},
}

--function widget:CommandNotify(cmdID, cmdParams, cmdOptions)
	--if cmdID == CMD_SETAIRPADEXCLUSION then
		--Spring.Echo("Run")
		--return true
--	end
--end

function widget:CommandsChanged()
		local customCommands = widgetHandler.customCommands
		customCommands[#customCommands+1] = cmdEXCLUDEDAIRPAD
end

local Chili, Screen0
 
local bgWindow
local testingButton
 
function widget:Initialize()	
  if (not WG.Chili) then
    -- don't run if we can't find Chili
    widgetHandler:RemoveWidget()
    return
  end

  -- Get ready to use Chili
  Chili = WG.Chili
  Screen0 = Chili.Screen0

  -- Create the window
  bgWindow = Chili.Window:New{
    parent = Screen0,
    x = '50%',
    y = '50%',
    width  = '60%',
    height = '60%',	
  }	



  -- Create some text inside the window
  testingButton = Chili.Button:New{
    parent = bgWindow,
    width  = '100%',
    height = '100%',
    caption = "Test",
    OnClick = { findAirpadUnderCursour() },
  }
end
  
local function findAirpadUnderCursour ()
  local mouseX, mouseY = Spring.GetMouseState()
--  print ("Mouse coordinates: (" .. mouseX .. ", " .. mouseY .. ")")
  local desc, args = Spring.TraceScreenRay(mouseX, mouseY, true)
  if nil == desc then return end -- off map
  local x = args[1]
  local y = args[2]
  local z = args[3]
  function() Spring.SendLuaRulesMsg("World coordinates: (" .. x .. ", " .. y .. ", " .. z .. ")")end
end


 -- function widget:CommandNotify(cmdID, cmdParams, cmdOptions)
   -- if cmdID == CMD_EXCLUDEAIRPAD then
     -- local x,y,z = cmdParams[1], cmdParams[2], cmdParams[3]
     -- Spring.Echo('sethaven|' .. x .. '|' .. y .. '|' .. z )
     -- return true
    --end
--  end
--end
