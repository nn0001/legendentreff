--Visit us at Legendentreff.de - CS:GO Cheating Community
--Get updates frequently on Discord: https://discordapp.com/invite/enpEU3W

local Misc_Ref = gui.Reference("MISC", "GENERAL", "Main");
local isPressed = false;
local spammed_last  = globals.TickCount();
local spamName = "I AM GAY";
local isStolen = false;

local function buttonPressed()
	isPressed = true;
	client.ChatSay("I am " .. spamName .. " and I AM GAY");
	--client.ChatSay("Legendentreff > you");
end
local Apply_Button = gui.Button( Misc_Ref, "NameFlex", buttonPressed )

local function changeGuiValues(i, i2)    
		gui.SetValue("msc_namestealer_enable", i);
		gui.SetValue("msc_namestealer_interval", i2);	
end

--todo
local function wait()
	print("Hier müsste man wahrscheinlich warten");
end

function nameSpam()
	local localPlayer = entities.GetLocalPlayer()
	if (localPlayer == nil) then
		isPressed = false;
	end
	if (isPressed) then
		if globals.TickCount() - spammed_last > 10 then
			if isStolen ~= true then
				changeGuiValues(1, 5);
				--wait();
				changeGuiValues(0, 0);
				isStolen = true;
			end
			spamName = spamName .. ' ';
			client.SetConVar("name", spamName , false);			
			spammed_last = globals.TickCount();			
		end
	end
end
callbacks.Register( "Draw", "name Spam", nameSpam);

--Lua made by nn 
--For more Luas: https://github.com/nn0001/legendentreff