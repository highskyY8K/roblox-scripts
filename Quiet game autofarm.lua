--loadstring(game:HttpGet("https://pastebin.com/raw/734gvrWq"))()
_G.Timelowered = 0 --dont change.
_G.Disablechat = true --if you enable it you cant disable it, you'll need to rejoin for it to work again.
_G.Enabled = true --if you want to deactivate this, change it to false then re-execute
local spoofYaxis = false
local totaltimeran = 0
local Players = game:GetService("Players")
local center = Vector3.new(0, -50, 0)
local player = Players.LocalPlayer
local sapewaiter = 0
local hiddenpart = Instance.new("Part", workspace)
hiddenpart.Transparency = 0.4
hiddenpart.Color = Color3.fromRGB(255, 0, 0)
hiddenpart.Anchored = true
hiddenpart.CFrame = CFrame.new(0, -50, 0)
hiddenpart.Material = Enum.Material.ForceField
hiddenpart.Size = Vector3.new(650, 5, 650)

if _G.Disablechat == true then
	local textboxContainer = game:GetService("CoreGui"):WaitForChild("ExperienceChat").appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox:Destroy()
end

if _G.Enabled == true then
	workspace.Gravity = 0
else
	workspace.Gravity = 196.2
end

task.spawn(function()
	while true do
		wait(1)
		totaltimeran = totaltimeran + 1
	end
end)

workspace.ChildAdded:Connect(function(Glass)
	if _G.Enabled == true then
		if Glass.Name == "Hourglass" then
			_G.Timelowered = _G.Timelowered + Glass:GetAttribute("Time")
			wait(0.22)
			player.Character.HumanoidRootPart.CFrame = CFrame.new(Glass.WorldPivot.Position.X, Glass.WorldPivot.Position.Y - 3, Glass.WorldPivot.Position.Z)
			wait(1 / math.random(2, 10))
			player.Character.HumanoidRootPart.CFrame = CFrame.new(0, -35, 0)
			print("Total time lowered: ", _G.Timelowered / 60, " Minutes")
			print("Total time ran: ", totaltimeran / 60, " Minutes")
		end
	end
end)

while true do
	wait(0.1)
	sapewaiter = sapewaiter + 1
	if sapewaiter > math.random(50, 100) then
		for _, Glass in pairs(workspace:GetChildren()) do
			if Glass.Name == "Hourglass" then
				_G.Timelowered = _G.Timelowered + Glass:GetAttribute("Time")
				wait(0.22)
				for i = 1, math.random(3, 15) do
					player.Character.HumanoidRootPart.CFrame = CFrame.new(Glass.WorldPivot.Position.X, Glass.WorldPivot.Position.Y - math.random(1, 25), Glass.WorldPivot.Position.Z)
					wait()	
				end
				player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.ButtonBases.FreeButton.Button.CFrame.X, workspace.ButtonBases.FreeButton.Button.CFrame.Y - 35, workspace.ButtonBases.FreeButton.Button.CFrame.Z)
			end
		end
	end
	
	if _G.Enabled == true then
		if workspace.ButtonBases.FreeButton.Button.SurfaceGui.Cooldown.Visible == false then
			player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.ButtonBases.FreeButton.Button.CFrame.X, workspace.ButtonBases.FreeButton.Button.CFrame.Y - 10, workspace.ButtonBases.FreeButton.Button.CFrame.Z)
			wait(0.3)
			player.Character.HumanoidRootPart.CFrame = workspace.ButtonBases.FreeButton.Button.CFrame
			wait(0.2)
			player.Character.HumanoidRootPart.CFrame = CFrame.new(workspace.ButtonBases.FreeButton.Button.CFrame.X, workspace.ButtonBases.FreeButton.Button.CFrame.Y - 35, workspace.ButtonBases.FreeButton.Button.CFrame.Z)
		else
			local circleRadius = math.random(15, 30)
			local angle = math.random(0, 3)
			
			angle = angle + math.rad(5)
			local x = center.X + circleRadius * math.cos(angle)
			local z = center.Z + circleRadius * math.sin(angle)
			if spoofYaxis == true then
				local y = center.Y + (circleRadius / 2) * math.tan(angle)
				player.Character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
			else
				player.Character.HumanoidRootPart.CFrame = CFrame.new(x, -35, z)
			end
		end
	end
end
