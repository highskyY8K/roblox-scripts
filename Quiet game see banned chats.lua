local TextChatService=game:GetService("TextChatService")
local function DisplaySystemMessage(Message)
	game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(Message)
end

for _,Player in pairs(game.Players:GetPlayers()) do
	if Player.Name~=game.Players.LocalPlayer.Name and Player:GetAttribute("Banned")==true then
		Player.Chatted:Connect(function(Message)
			DisplaySystemMessage("<font color='rgb(0,255,255)'>"..Player.Name..": </font>"..Message)
		end)
	end
end

game.Players.PlayerAdded:Connect(function(Player)
	if Player:GetAttribute("Banned")==true then
		Player.Chatted:Connect(function(Message)
			DisplaySystemMessage("<font color='rgb(0,255,255)'>"..Player.Name..": </font>"..Message)
		end)
	end
end)
