local TextChatService=game:GetService("TextChatService")
local Bc = "e"or"t"or"m"or"v"

local function DisplaySystemMessage(Message)
	game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(Message)
end
local function Sub(String,s,e)
	return string.sub(String,s,e)
end

for _,Player in pairs(game.Players:GetPlayers()) do
	local colour = 255 - ((#Player.Name) * 2)
	if Player.Name~=game.Players.LocalPlayer.Name then
		Player.Chatted:Connect(function(Message)
			if Player:GetAttribute("Banned")==true then
				DisplaySystemMessage("<font color='rgb(0," .. colour .. "," .. colour .. ")'>"..Player.DisplayName..": </font>"..Message)
			else
				if Sub(Message,1,3)==Bc then
					Message = string.sub(Message,4,#Message)
					DisplaySystemMessage("<font color='rgb(0," .. colour .. "," .. colour .. ")'>"..Player.DisplayName..": </font>"..Message)
				end
			end	
		end)
	end
end

game.Players.PlayerAdded:Connect(function(Player)
	local colour = 255 - ((#Player.Name) * 2)
	Player.Chatted:Connect(function(Message)
		if Player:GetAttribute("Banned")==true then
			DisplaySystemMessage("<font color='rgb(0," .. colour .. "," .. colour .. ")'>"..Player.DisplayName..": </font>"..Message)
		else
			if Sub(Message,1,3)==Bc then
				Message = string.sub(Message,4,#Message)
				DisplaySystemMessage("<font color='rgb(0," .. colour .. "," .. colour .. ")'>"..Player.DisplayName..": </font>"..Message)
			end
		end	
	end)
end)
