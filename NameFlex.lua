--Visit us at Legendentreff.de - CS:GO Cheating Community
--Get updates frequently on Discord: https://discordapp.com/invite/enpEU3W

local Misc_Ref = gui.Reference("MISC", "GENERAL", "Main");
local isPressed = false;
local spammed_last  = globals.TickCount();
local spamName = client.GetConVar("name");

local function buttonPressed()
	isPressed = true;
	--client.ChatSay("Legendentreff > you");
end
local Apply_Button = gui.Button( Misc_Ref, "Nameflex", buttonPressed )

function nameSpam()
	local localPlayer = entities.GetLocaPlayer()
	if (localPlayer == nil) then
		isPressed = false;
	end
	if (isPressed) then
		if globals.TickCount() - spammed_last > 10 then
			spamName = spamName .. ' ';
			client.SetConVar("name", spamName , false);
			spammed_last = globals.TickCount();
		end
	end
end
callbacks.Register( "Draw", "name Spam", nameSpam);

--Lua made by nn 
--For more Luas: https://github.com/nn0001/legendentreff