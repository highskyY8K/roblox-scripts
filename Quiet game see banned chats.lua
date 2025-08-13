local TextChatService=game:GetService("TextChatService")
local Bc={"/t ","/m ","/v "}

local function DisplaySystemMessage(Message)
	game.TextChatService.TextChannels.RBXSystem:DisplaySystemMessage(Message)
end
local function UDChat(Message)
	for _,v in ipairs(Bc)do
		if string.sub(Message,1,3)==v then
			return true
		end
	end
	return false
end

for _,Player in pairs(game.Players:GetPlayers())do
	if Player.Name~=game.Players.LocalPlayer.Name then
		local colour=255-((#Player.Name)*2)
		Player.Chatted:Connect(function(Message)
			if Player:GetAttribute("Banned")==true then
				DisplaySystemMessage("<font color='rgb(0,"..colour..","..colour..")'>"..Player.DisplayName..": </font>"..Message)
			else
				if UDChat(Message)==true then
					colour-=10
					Message=string.sub(Message,4,#Message)
					DisplaySystemMessage("<font color='rgb(0,"..colour..","..colour..")'>"..Player.DisplayName..": </font>"..Message)
				end
			end	
		end)
	end
end

game.Players.PlayerAdded:Connect(function(Player)
	Player.Chatted:Connect(function(Message)
		local colour=255-((#Player.Name)*2)
		if Player:GetAttribute("Banned")==true then
			DisplaySystemMessage("<font color='rgb(0,"..colour..","..colour..")'>"..Player.DisplayName..": </font>"..Message)
		else
			if UDChat(Message)==true then
				colour-=10
				Message=string.sub(Message,4,#Message)
				DisplaySystemMessage("<font color='rgb(0,"..colour..","..colour..")'>"..Player.DisplayName..": </font>"..Message)
			end
		end	
	end)
end)
