local TextChatService=game:GetService("TextChatService")
local function DisplaySystemMessage(Message)
	game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(Message)
end

for _,Player in pairs(game.Players:GetPlayers()) do
	local colour = 255 - ((#Player.Name) * 2)
	if Player.Name~=game.Players.LocalPlayer.Name then
		Player.Chatted:Connect(function(Message)
			if Player:GetAttribute("Banned")==true then
				DisplaySystemMessage("<font color='rgb(0," .. colour .. "," .. colour .. ")'>"..Player.DisplayName..": </font>"..Message)
			else
				if string.sub(Message,1,3)=="/t "then
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
			if string.sub(Message,1,3)=="/t "then
				DisplaySystemMessage("<font color='rgb(0," .. colour .. "," .. colour .. ")'>"..Player.DisplayName..": </font>"..Message)
			end
		end	
	end)
end)
