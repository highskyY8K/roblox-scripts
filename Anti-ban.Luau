if getgenv().ABQG then return end
local safetorenew=true
getgenv().ABQG=safetorenew
print"Executed_AB"
pcall(function()
	game:GetService("Lighting").BanBlur:Destroy()
end)
local lp=game.Players.LocalPlayer
local lpCharacter=lp.Character

function renewcharacter(oldcamrotation, oldhrpos)
	game.Players.LocalPlayer:SetAttribute("Banned",false)
	safetorenew=false
	local player=game:GetService("Players").LocalPlayer
	if replicatesignal then
		replicatesignal(player.ConnectDiedSignalBackend)
		task.wait(game.Players.RespawnTime-0.165)
	end
	if not replicatesignal then wait() end
	player.Character:ClearAllChildren()
	local newcharacter=Instance.new("Model")
	newcharacter.Parent=workspace
	player.Character=newcharacter
	wait()
	player.Character=player.Character
	newcharacter:Destroy()
	task.wait(game.Players.RespawnTime-2.25)
	local char=player.Character
	workspace.Camera.CameraSubject,workspace.Camera.CFrame=nil,oldcamrotation
	char.HumanoidRootPart.CFrame=CFrame.new(0,9999999999,0) task.wait(0.2)
	workspace.Camera.CFrame,char.HumanoidRootPart.CFrame=oldcamrotation,oldhrpos
	safetorenew=true
end

local function CDEvent(character)
	character.Destroying:Connect(function()
		print"Renewing!4"
		renewcharacter(workspace.Camera.CFrame,character.HumanoidRootPart.CFrame)
		safetorenew=false
	end)
end

if lpCharacter then
	CDEvent(lpCharacter)
	if lp.PlayerGui.BanGui.Enabled then lpCharacter.Humanoid.Health=-1 end
end

lp.CharacterAdded:Connect(function(character)
	CDEvent(character)
end)


--[[
--Quiet game | Anti ban :D
HighskyY8K- 19/04/2025 19:20

first time it succesfully worked was at that time! 
fully functional at 20/04/2025 no idea what unix tho :(

]]
