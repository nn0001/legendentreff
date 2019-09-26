--Visit us at Legendentreff.de - CS:GO Cheating Community
--Get updates frequently on Discord: https://discordapp.com/invite/enpEU3W

local Misc_Ref = gui.Reference("MISC", "GENERAL", "Main");
local isPressed = false;
local spammed_last  = globals.TickCount();
local spamName = "Legendentreff.de > you";
local count = 0;
local originalName = client.GetConVar("name");

local function buttonPressed()
	isPressed = true;
	client.ChatSay("Legendentreff > you");
end
local Apply_Button = gui.Button( Misc_Ref, "Nameflex", buttonPressed )

function nameSpam()
	local localPlayer = entities.GetLocalPlayer()
	if (localPlayer == nil) then
		isPressed = false;
	end
	if (isPressed) then
		if globals.TickCount() - spammed_last > 10 then
			if(count < 4) then
			spamName = spamName .. ' ';
			client.SetConVar("name", spamName , false);			
			else
				client.SetConVar("name", originalName , false);
			end
			spammed_last = globals.TickCount();
			count = count + 1;
		end
	end
end
callbacks.Register( "Draw", "name Spam", nameSpam);

--Lua made by nn 
--For more Luas: https://github.com/nn0001/legendentreff