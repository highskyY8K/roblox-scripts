--services
local sgui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Uis = game:GetService("UserInputService")
--loadstrings
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
--random ass variables
local updatedgv = "934" 
local loaded = false
local Tabsize = 120
local Winsize = UDim2.fromOffset(580, 360)
local titlename = "Gumstra V1.691"
local mouse = Players.LocalPlayer:GetMouse()
--arrays
local wlistedplayers = {""}
local toollist = {"Sword", "Slingshot", "Rocket", "Bomb", "Superball", "PaintballGun"}
local knownadminslist = {"maya_png", "DanteLike", "fimnik", "MishaHahaLol", "s8nIV", "cowlover4499", "gamertomsuper", "Audaciety", "ThatLuxray35", "gatlated", "shibqz"}
local knownreportslist = {"lemurbeanthegreat", "siisixuccuuc", "Doe_JohnRBLX"}
--Functions
local function EquipTool(tool, grip, override, Unequip)
	local backpack = Players.LocalPlayer:FindFirstChildOfClass("Backpack")
	local character = Players.LocalPlayer.Character
	local toolfound = backpack:FindFirstChild(tool)

	if toolfound then
		if override == true then
			wait(0.35) 
			toolfound.GripPos = Vector3.new(75, 750, 75) 
			toolfound.Parent = character
			wait(0.1) 
			local toolfoundc = character:FindFirstChild(tool) 
			if tool == "Rocket" then 
				toolfoundc.GripPos = Vector3.new(-0.578999996, -0.596000016, 0.074000001, -0.000692009926, 0.00872156397, 0.999961734, -0.0214206018, 0.999732375, -0.00873438641, -0.999770284, -0.0214258246, -0.000504970551) 
			elseif tool == "Bomb" then 
				toolfoundc.GripPos = Vector3.new(6.40836242e-06, -0.0700001493, -6.40829876e-06, 1, 0, 0, 0, 0, -1, 0, 1, 0) 
			end
		else
			
			if tool == "Rocket" then
				toolfound.GripPos = Vector3.new(grip.x, grip.y, grip.z)
				print(grip)
			elseif tool == "Bomb" then
				toolfound.GripPos = Vector3.new(grip.x, grip.y, grip.z)
				print(grip)
			end
			
			
			toolfound.Parent = character
		end
	end
	
	if Unequip == true then
		local toolchar = character:FindFirstChild(tool)
		if tool == "Rocket" then 
			toolchar.GripPos = Vector3.new(-0.579, -0.596, 0.074) 
		elseif tool == "Bomb" then 
			toolchar.GripPos = Vector3.new(0, -0.07000014930963516, 0) 
		end
		toolchar.Parent = backpack
	end
end


local function GetEquipTools(tool)
	for i = 1, #toollist do
		if toollist[i] == tool then
			return Players.LocalPlayer.Character:FindFirstChild(tool)
		end
	end
	return nil
end
--Mobile Check
local mobilecheck = table.find({
	Enum.Platform.IOS, 
	Enum.Platform.Android
}, Uis:GetPlatform())

if mobilecheck then
	Winsize = UDim2.fromOffset(420, 280) -- yea yea the settings ain't perfect, atleast it fits on the screen xD
	Tabsize = 90
	loadstring(game:HttpGet("https://raw.githubusercontent.com/Gumicuci/roblox-scripts/refs/heads/main/mobile%20drag.lua"))()
else
	Winsize = UDim2.fromOffset(580, 360)
	Tabsize = 120
end
--random
Fluent:Notify({
	Title = "Loading...",
	SubContent = "Script is currently loading, Please wait a few seconds!",
	Duration = 10
})
if Players.LocalPlayer.AccountAge > math.random(150, 366) then
	Fluent:Notify({
		Title = "Really.",
		SubContent = "If i was you i'd use an alt account for exploiting :/",
		Duration = 5
	})
end
print("\n\nGumstra is updated for Game Version V" .. updatedgv .. ",\nCurrent Game Version: V" .. game.PlaceVersion .. "\n")
--Gumstra
local Window = Fluent:CreateWindow({
	Title = titlename,
	SubTitle = "by highskyY8K",
	TabWidth = Tabsize,
	Size = Winsize,
	Acrylic = false, -- if true it breaks the ranged weapons making it unusable
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl 
})


local Tabs = {
	Main = Window:AddTab({ Title = "Main", Icon = "locate" }),
	Player = Window:AddTab({ Title = "Player", Icon = "user" }),
	Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

local Options = Fluent.Options

do
	Fluent:Notify({
		Title = "WARNING",
		SubContent = "If you use this script or any other you can get banned depending on what you use, USE CAREFULLY!!",
		Duration = 10 + math.random(0, 20)
	})
	---main V
	Tabs.Main:AddParagraph({
		Title = "Warning",
		Content = "Please use these scripts in this tab with caution.\nYou can get banned easily IF u are caught!"
	})

	Tabs.Main:AddSection("Teleports")

	local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
		Title = "Teleports",
		Values = {
			"Yellow bottom floor", "Yellow top floor", "Yellow Bridge", "Yellow Hut",
			"Red bottom floor", "Red top floor", "Red Bridge", "Red Hut",
			"Blue bottom floor", "Blue top floor", "Blue Bridge", "Blue Hut",
			"Green bottom floor", "Green top floor", "Green Bridge", "Green Hut",
			"Spectator:PWNAGE", "Spectator:Minigames", "Spectator:Frenzy", "Spectator:CrossRoads", "Spectator:LeaderBoard", "None"
		},

		Multi = false,
		Default = 1,
	})

	Dropdown:SetValue("None")

	Dropdown:OnChanged(function(Value)
		local plHRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

		if plHRP then
			if Value == "Yellow bottom floor" then
				plHRP.CFrame = CFrame.new(151, 22, 7) --
			elseif Value == "Yellow top floor" then
				plHRP.CFrame = CFrame.new(132, 117, -1) --
			elseif Value == "Yellow Bridge" then
				plHRP.CFrame = CFrame.new(94, 131, -0) --	
			elseif Value == "Yellow Hut" then
				plHRP.CFrame = CFrame.new(130, 129, 0) --
			elseif Value == "Red bottom floor" then
				plHRP.CFrame = CFrame.new(-150, 22, -6) --
			elseif Value == "Red top floor" then
				plHRP.CFrame = CFrame.new(-131, 117, -0)
			elseif Value == "Red Bridge" then
				plHRP.CFrame = CFrame.new(-94, 131, 0)
			elseif Value == "Red Hut" then
				plHRP.CFrame = CFrame.new(-130, 129, 1)
			elseif Value == "Blue bottom floor" then
				plHRP.CFrame = CFrame.new(-6, 22, 152)
			elseif Value == "Blue top floor" then
				plHRP.CFrame = CFrame.new(-1, 117, 131)
			elseif Value == "Blue Bridge" then
				plHRP.CFrame = CFrame.new(0, 131, 95)
			elseif Value == "Blue Hut" then
				plHRP.CFrame = CFrame.new(1, 129, 132)
			elseif Value == "Green bottom floor" then
				plHRP.CFrame = CFrame.new(6, 22, -151)
			elseif Value == "Green top floor" then
				plHRP.CFrame = CFrame.new(-1, 117, -131)	
			elseif Value == "Green Bridge" then
				plHRP.CFrame = CFrame.new(-0, 131, -94)
			elseif Value == "Green Hut" then
				plHRP.CFrame = CFrame.new(-1, 129, -131)
			elseif Value == "Spectator:PWNAGE" then
				plHRP.CFrame = CFrame.new(-32, 751, 32)
			elseif Value == "Spectator:Minigames" then
				plHRP.CFrame = CFrame.new(-32, 751, -32)
			elseif Value == "Spectator:Frenzy" then
				plHRP.CFrame = CFrame.new(32, 751, -32)
			elseif Value == "Spectator:CrossRoads" then
				plHRP.CFrame = CFrame.new(32, 751, 32)
			elseif Value == "Spectator:LeaderBoard" then
				plHRP.CFrame = CFrame.new(-39, 719, 0)
			end	
		end
	end)

	--tp to player 
	local playerNames = {"W", "E"}


	local Dropdown = Tabs.Main:AddDropdown("tpplayer", {
		Title = "Teleport to player",
		Values = playerNames,

		Multi = false,
		Default = 1,
	})

	Dropdown:OnChanged(function(Value)
		table.clear(playerNames)
		for _, player in ipairs(Players:GetPlayers()) do
			table.insert(playerNames, player.DisplayName)
		end
		Options.tpplayer.Values = playerNames

		Players.PlayerAdded:Connect(function(player)
			table.insert(playerNames, player.DisplayName)
			Options.tpplayer.Values = playerNames
		end)

		Players.PlayerRemoving:Connect(function(player)
			for i, name in ipairs(playerNames) do
				if name == player.DisplayName then
					table.remove(playerNames, i)
				end
			end
			Options.tpplayer.Values = playerNames
		end)

		for _, GetplrName in ipairs(Players:GetPlayers()) do
			if GetplrName.DisplayName == Value then
				local plHRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
				plHRP.CFrame = GetplrName.Character:WaitForChild("HumanoidRootPart").CFrame
			end
		end

		Options.tpplayer.Values = playerNames

	end)

	Dropdown:SetValue(Players.LocalPlayer.DisplayName)

	Tabs.Main:AddSection("Murder")

	local Toggle = Tabs.Main:AddToggle("whitelistfriends", {Title = "White List Friends", Default = false })

	Toggle:OnChanged(function(Value)
		_G.whitelistfriends = Value
	end)

	Options.whitelistfriends:SetValue(false)

	local Dropdownkillall = Tabs.Main:AddDropdown("Killallmode", {
		Title = "Kill All Method",
		Values = {"None", "RPG", "Bomb"},

		Multi = false,
		Default = 1,
	})

	Dropdownkillall:OnChanged(function(Value)
		if Value == "RPG" then
			_G.KAGmode = "Rocket"
		else
			_G.KAGmode = Value
		end
	end)

	Dropdownkillall:SetValue("None")

	local Toggle = Tabs.Main:AddToggle("killall", {Title = "Kill All", Default = false })
	local projectilesFolder = game.Workspace:WaitForChild("Projectiles"):WaitForChild("Active")
	local playerFolder = projectilesFolder:WaitForChild(Players.LocalPlayer.Name)


	Options.killall:SetValue(false)

	Toggle:OnChanged(function(Value)
		playerFolder.ChildAdded:Connect(function(part)
			if Options.killall.Value == true then
				if _G.KAGmode == "Bomb" then
					if part:IsA("Part") and part.Name == Players.LocalPlayer.Name.. "'s Bomb" then
						part.Anchored = true
						part.CFrame = CFrame.new(1000, 25, 0)
						wait(2)
						local startTime = tick()
						while tick() - startTime < 3 do
							for _, player in pairs(Players:GetPlayers()) do
								if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
									part.Anchored = true
									part.CFrame = CFrame.new(1000, 25, 0)
									if _G.whitelistfriends == true then
										local isFriend = Players.LocalPlayer:IsFriendsWith(player.UserId)
										if not isFriend then
											player.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 25, 0)
										end
									else
										player.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 25, 0)
									end
								end
							end
							task.wait()
						end
						wait()
					end
				elseif _G.KAGmode == "Rocket" then
					if part:IsA("Part") and part.Name == Players.LocalPlayer.Name.. "'s Rocket" then
						part.Anchored = false
						local startTime = tick()
						while tick() - startTime < 1 do
							for _, player in pairs(Players:GetPlayers()) do
								if player ~= Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
									if _G.whitelistfriends == true then
										local isFriend = Players.LocalPlayer:IsFriendsWith(player.UserId)
										if not isFriend then
											player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(1000, 25, -1)
											part.Rotation = Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360))
											part.CFrame = CFrame.new(1000, 25, 0)
										end
									else
										player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(1000, 25, -1)
										part.Rotation = Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360))
										part.CFrame = CFrame.new(1000, 25, 0)
									end
								end
							end
							task.wait()
						end
						wait()
					end
				end
			end
		end)	
	end)

	_G.OldnameTA = "w"
	_G.NewnameTA = ""	
	
	--TODO CHANGE THIS WHOLE THING V HERE TO A BUTTON THAT MAKES A NEW GUI AND IT SHOWS THE NAME OF THE PLAYER YOU WANT TO ATTACK, I HAVE NO FUCKING IDEA WHY IT LOADS GUMSTRA AGAIN?
	--[[
	local Input = Tabs.Main:AddInput("arabpeople", {
		Title = "Terrorist Attack",
		Default = "",
		Placeholder = "Target",
		Numeric = false, -- Only allows numbers
		Finished = false, -- Only calls callback when you press enter
	})
	
	local TAcheckedoff = false
	
	Input:OnChanged(function()
		TAcheckedoff = false
		if _G.NewnameTA ~= _G.OldnameTA then
			playerFolder.ChildAdded:Connect(function(part)
				if TAcheckedoff == false then
					local displayName = Input.Value
					for _, player in pairs(Players:GetChildren()) do
						if player.DisplayName:lower():sub(1, #displayName) == displayName:lower() then
							displayName = player.Name
							Input:SetValue(displayName)
						end
					end
					if part:IsA("Part") and part.Name == Players.LocalPlayer.Name.."'s Bomb" then
						local wasd = Players:FindFirstChild(displayName)
						if wasd then
							if displayName ~= Players.LocalPlayer.Name then
								local humanoidRootPart = wasd.Character:WaitForChild("HumanoidRootPart")
								part.CFrame = CFrame.new(0, 1000, 0)
								part.Anchored = true
								
								wait(1.6)
								local startTime = tick()
								while tick() - startTime < 1 do
									part.Transparency = 1
									part.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -1, 0)
									part.CanCollide = false
									task.wait()
								end 
							end
						end
					end
					TAcheckedoff = true
				end
			end)
			_G.OldnameTA = _G.NewnameTA
		end
	end)
	]]
	
	Tabs.Main:AddSection("Protection")

	local Toggle = Tabs.Main:AddToggle("ff", {Title = "Force-Field", Default = false })

	Options.ff:SetValue(false)

	Toggle:OnChanged(function(Value)
		local lasttool = ""
		
		local function checkProximity()
			for _, player in pairs(Players:GetPlayers()) do
				local LocalPlayer = Players.LocalPlayer
				local Character = game.Workspace:WaitForChild(LocalPlayer.Name)
				if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
					local distance = (player.Character.HumanoidRootPart.Position - Character:WaitForChild("HumanoidRootPart").Position).magnitude
					if distance <= 11 and player.Team ~= LocalPlayer.Team then
						if player.Character.Humanoid.Health > 0 then
							local headPosition = player.Character.Head.Position
							local rootPosition = Character.HumanoidRootPart.Position
							local lookVector = (headPosition - rootPosition).unit
							lookVector = Vector3.new(lookVector.X, 0, lookVector.Z).unit
							--
							if _G.whitelistfriends == true then
								if not LocalPlayer:IsFriendsWith(player.UserId) then
									local sword = Character:FindFirstChild("Sword")
									if sword then
										sword.Handle.Transparency = 1
										Character.HumanoidRootPart.CFrame = CFrame.new(rootPosition, rootPosition + lookVector)

										local rotationX, rotationY, rotationZ = sword.Grip.Rotation:ToOrientation()
										local isNegativeX, isNegativeY, isNegativeZ = rotationX < 0, rotationY < 0, rotationZ < 0

										if isNegativeY and isNegativeZ then 
											for i = 1, math.random(2, 5) do
												sword.GripPos = Vector3.new(-distance + math.random(150, 350) / 100, -1.3 + math.random(0, 40) / 100, math.random(-350, 350) / 100)
											end	
										else
											for i = 1, math.random(2, 5) do
												sword.GripPos = Vector3.new(distance - 2, 1.3 + math.random(0, 40) / 100, math.random(-350, 350) / 100)
											end		
										end
									else 
										sword = LocalPlayer.Backpack:FindFirstChild("Sword")
										sword.GripPos = Vector3.new(1000, 0, 0)
										sword.Parent = Players.LocalPlayer.Character
									end
								end
							else
								local sword = Character:FindFirstChild("Sword")
								if sword then
									sword.Handle.Transparency = 1
									Character.HumanoidRootPart.CFrame = CFrame.new(rootPosition, rootPosition + lookVector)

									local rotationX, rotationY, rotationZ = sword.Grip.Rotation:ToOrientation()
									local isNegativeX, isNegativeY, isNegativeZ = rotationX < 0, rotationY < 0, rotationZ < 0

									if isNegativeY and isNegativeZ then 
										for i = 1, math.random(2, 5) do
											sword.GripPos = Vector3.new(-distance + math.random(150, 350) / 100, -1.3 + math.random(0, 40) / 100, math.random(-350, 350) / 100)
										end	
									else
										for i = 1, math.random(2, 5) do
											sword.GripPos = Vector3.new(distance - 2, 1.3 + math.random(0, 40) / 100, math.random(-350, 350) / 100)
										end		
									end
								else 
									sword = LocalPlayer.Backpack:FindFirstChild("Sword")
									sword.GripPos = Vector3.new(1000, 0, 0)
									sword.Parent = Players.LocalPlayer.Character
								end
							end
						else
							local swordd = Character:FindFirstChild("Sword")
							if swordd then
								swordd = LocalPlayer.Character:FindFirstChild("Sword")
								swordd.Handle.Transparency = 0
								swordd.Parent = Players.LocalPlayer.Backpack
								Players.LocalPlayer.Backpack.Sword.GripPos = Vector3.new(0, 0, -1.5)
							end
						end
					end
				end
			end
		end

		local function ff()
			while Options.ff.Value == true do
				checkProximity()
				wait(0.01)
			end
		end
		ff()

	end)

	local Slider = Tabs.Main:AddSlider("instakillpower", {
		Title = "insta-kill Strength",
		Description = "Sets the power of insta-kill.",
		Default = 0,
		Min = 1,
		Max = 100,
		Rounding = 0.1,
		Callback = function(Value)
			_G.IKpower = Value
		end
	})

	Slider:SetValue(1)

	local Toggle = Tabs.Main:AddToggle("instakillsword", {Title = "Insta-Kill Sword", Default = false })

	Toggle:OnChanged(function()
		local function runAV()
			while Options.instakillsword.Value == true do
				local sword = game.Players.LocalPlayer.Character:FindFirstChild("Sword")

				if sword then 
					if math.random(0, 1) == 1 then
						sword.GripPos = Vector3.new(0.0001 * math.random(1, 1 + _G.IKpower), 0.0001 * math.random(1, 1 + _G.IKpower), -1.5 * "1.000" .. math.random(0, _G.IKpower))
					else
						sword.GripPos = Vector3.new(0.0002 * math.random(1, 1 + _G.IKpower), 0.0002 * math.random(1, 1 + _G.IKpower), -1.5 * "1.000" .. math.random(0, _G.IKpower))
					end

				end

				task.wait()
			end
		end
		runAV()
	end)


	Options.instakillsword:SetValue(false)




	---Player V
	Tabs.Player:AddSection("User Modifications")

	local Slider = Tabs.Player:AddSlider("Slider", {
		Title = "Speed",
		Description = "Increases your walk speed",
		Default = 16,
		Min = 10,
		Max = math.random(60, 100),
		Rounding = 0.1,
		Callback = function(Value)
			local plHDe = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

			if plHDe then
				plHDe.WalkSpeed = Value
			end
		end
	})

	Slider:SetValue(16)

	local Slider = Tabs.Player:AddSlider("Slider", {
		Title = "Jump Power",
		Description = "Increases your jump power",
		Default = 50,
		Min = 30,
		Max = math.random(100, 350),
		Rounding = 0.1,
		Callback = function(Value)
			local plHDe = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

			if plHDe then
				plHDe.JumpPower = Value
			end
		end
	})

	Slider:SetValue(50)

	Tabs.Player:AddButton({
		Title = "Hide Avatar (NOT FE)",
		Description = "Hides your avatar so no one can see it if your making a video.",
		Callback = function()
			for _, v in pairs(Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Pants") then
					v.PantsTemplate = "rbxassetid://0"
				elseif v:IsA("Accessory") then
					v:Destroy()
				elseif v:IsA("Shirt") then
					v.ShirtTemplate = "rbxassetid://0"
				end
			end
		end
	})

	local Toggle = Tabs.Player:AddToggle("HPNfriends", {Title = "Hide Your Friend's Displayname", Default = false })

	Toggle:OnChanged(function(Value)
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChild("Humanoid") then
				if Players.LocalPlayer:IsFriendsWith(player.UserId) then
					if Options.HPNfriends.Value == true then
						player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
					else
						player.Character.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
					end
				end
			end
		end
	end)

	Tabs.Player:AddSection("External scripts")

	Tabs.Player:AddButton({
		Title = "IY",
		Description = "Execute Infinite yield",
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
		end
	})
	

	Tabs.Player:AddSection("ESP")

	local Slider = Tabs.Player:AddSlider("espsize", {
		Title = "Esp Size",
		Description = "Changes the size of esp's box",
		Default = 2.5,
		Min = 0.5,
		Max = 5,
		Rounding = 1,
		Callback = function(Value)
			_G.espsize = Value
		end
	})

	Slider:SetValue(2.5)
	
	local Toggle = Tabs.Player:AddToggle("esp", {Title = "Esp", Default = false })

	Toggle:OnChanged(function(Value)
		local function BrightenColor(color)
			return Color3.new(
				math.min(color.R * 1.3, 1),
				math.min(color.G * 1.3, 1),
				math.min(color.B * 1.3, 1)
			)
		end

		local function CreateBox(player)
			local Box = Drawing.new("Square")
			Box.Visible = false
			Box.Transparency = 1
			
			local function UpdateBox()
				wait()
				if Options.esp.Value then
					Box.Thickness = _G.espsize
					local character = player.Character
					if character and character:FindFirstChild("HumanoidRootPart") then
						local rootPart = character:FindFirstChild("HumanoidRootPart")
						local position, onScreen = workspace.CurrentCamera:WorldToViewportPoint(rootPart.Position)

						if player:IsInGroup(13116289) then
							local hue = (tick() * 2) % 5 / 5
							Box.Color = Color3.fromHSV(hue, 1, 1)
						elseif table.find(knownadminslist, player.Name) then
							Box.Color = Color3.fromRGB(0, 0, 0)						
						else
							Box.Color = BrightenColor(player.TeamColor.Color)
						end

						if onScreen then
							Box.Size = Vector2.new(2000 / position.Z, 4000 / position.Z)
							Box.Position = Vector2.new(position.X - Box.Size.X / 2, position.Y - Box.Size.Y / 2)
							Box.Visible = true
						else
							Box.Visible = false
						end
					else
						Box.Visible = false
					end
				else
					Box.Visible = false
				end
			end

			game:GetService("RunService").RenderStepped:Connect(UpdateBox)

			player.CharacterRemoving:Connect(function()
				if Options.esp.Value then
					Box.Visible = false
				end
			end)

			UpdateBox()

		end
		Players.PlayerAdded:Connect(function(player)
			if Options.esp.Value then
				if player ~= Players.LocalPlayer then
					CreateBox(player)
				end
			end
		end)

		for _, player in pairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer then
				CreateBox(player)
			end
		end
	end)
	
	

	Tabs.Player:AddSection("Other")

	local Slider = Tabs.Player:AddSlider("Invisflyspeed", {
		Title = "Invis-Fly",
		Description = "Changes the speed of invis fly!",
		Default = 50,
		Min = 35,
		Max = 275,
		Rounding = 0.1,
		Callback = function(Value)
			_G.invisspeed = Value
		end
	})

	Slider:SetValue(50)

	local Toggle = Tabs.Player:AddToggle("invisfly", {Title = "Invis-Fly", Default = false })


	Toggle:OnChanged(function(Value)
		Players.LocalPlayer.CharacterAdded:Connect(function()
			if Options.invisfly.Value then
				Options.invisfly:SetValue(false)
			end
		end)

		local CFloop

		if Options.invisfly.Value == true then
			local pastposhrp = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100000000000, 0)
			wait(0.05 * math.random(2, 8))
			local Head = Players.LocalPlayer.Character:WaitForChild("Head")
			Head.Anchored = true

			if CFloop then 
				CFloop:Disconnect()
			end
			
			CFloop = RunService.Heartbeat:Connect(function(deltaTime)
				if Options.invisfly.Value == true then
					local moveDirection = Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").MoveDirection * (_G.invisspeed * deltaTime)
					local headCFrame = Head.CFrame
					local cameraCFrame = workspace.CurrentCamera.CFrame
					local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
					cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
					local cameraPosition = cameraCFrame.Position
					local headPosition = headCFrame.Position

					local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
					Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
				end
			end)
			Head.CFrame = pastposhrp
		else
			if CFloop then
				CFloop:Disconnect()
			end
			local Head = Players.LocalPlayer.Character:FindFirstChild("Head")
			if Head then
				Head.Anchored = false
			end
		end
		


	end)

	local Slider = Tabs.Player:AddSlider("VoidLP", {
		Title = "Launch Power",
		Description = "Anti-Void Launch Power",
		Default = 100,
		Min = 25 + math.random(-5, 20),
		Max = 300,
		Rounding = 0.1,
		Callback = function(Value)
			_G.AVpower = Value
		end
	})

	Slider:SetValue(100)

	local Toggle = Tabs.Player:AddToggle("Antivoid", {Title = "Anti-Void", Default = false })

	Toggle:OnChanged(function()
		local function runAV()
			while Options.Antivoid.Value == true do
				local character = game.Players.LocalPlayer.Character

				if character and character:FindFirstChild("HumanoidRootPart") then
					if character.HumanoidRootPart.Position.Y <= -20 then
						local bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.Velocity = Vector3.new(0, _G.AVpower, 0)
						bodyVelocity.MaxForce = Vector3.new(0, 1000000, 0)
						bodyVelocity.Parent = character.HumanoidRootPart

						game:GetService("Debris"):AddItem(bodyVelocity, 0.5)
					end
				end
				wait()
			end
			wait()
		end
		runAV()
	end)

	Options.Antivoid:SetValue(false)


	---Settings V

	Tabs.Settings:AddSection("World")

	local Toggle = Tabs.Settings:AddToggle("daynight", {Title = "Day / Night", Default = false })

	Toggle:OnChanged(function()
		if Options.daynight.Value == false then
			game.Lighting.ClockTime = 12
		else
			game.Lighting.ClockTime = 0
		end
	end)

	Options.daynight:SetValue(false)


	local grav = Tabs.Settings:AddSlider("Slider", {
		Title = "Gravity",
		Description = "Change the world's Gravity",
		Default = 196.2,
		Min = 0,
		Max = math.random(400, 750),
		Rounding = 0,
		Callback = function(Value)
			workspace.Gravity = Value
		end
	})

	grav:OnChanged(function(Value)
		workspace.Gravity = Value
	end)

	grav:SetValue(196.2)

	Tabs.Settings:AddButton({
		Title = "Fix Gravity",
		Description = "Sets it back to the default, 196.2",
		Callback = function()
			game.Workspace.Gravity = 196.2
			grav:SetValue(196.2)
		end
	})


	--[[ this part is probably broken / it only works for the localplayer's active parts e.g rocket or bombs, not the other players
	local MultiDropdown = Tabs.Settings:AddDropdown("disabletools", {
		Title = "Disable Tool",
		Description = "Breaks everyone's tool/s except yours, making them Unusable!",
		Values = {"Slingshot", "RPG", "Bomb", "Superball", "Paintball"},
		Multi = true,
		Default = {},
	})

	MultiDropdown:OnChanged(function(Value)
		local selectedTools = {}
		for toolName, state in pairs(Value) do
			if state then
				table.insert(selectedTools, toolName)
			end
		end

		print("Multidropdown changed:", table.concat(selectedTools, ", "))
		-- Anchor new descendants and set their CFrame
		for _, child in pairs(projectilesFolder:GetChildren()) do
			child.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("BasePart") then
					for _, toolName in pairs(selectedTools) do
						if string.find(descendant.Name, toolName, 1, true) then
							descendant.Anchored = true
							descendant.CFrame = CFrame.new(0, 2500, 0)
						end
					end
				end
			end)
		end
	end)
	]]



	Tabs.Settings:AddSection("projectiles")

	local Slider = Tabs.Settings:AddSlider("prosize", {
		Title = "Projectile size",
		Description = "Increases Your projectile's size by a set amount!",
		Default = 1,
		Min = 0.5,
		Max = 3,
		Rounding = 1,
		Callback = function(Value)
			local projectilesFolder = game.Workspace:WaitForChild("Projectiles"):WaitForChild("Active")
			local playerFolder = projectilesFolder:WaitForChild(game.Players.LocalPlayer.Name)

			playerFolder.ChildAdded:Connect(function()
				for _, v in pairs(playerFolder:GetChildren()) do
					if string.find(v.Name, "Pellet") then
						if v.ClassName == "Part" then
							for i = 1, math.random(2, 10) do
								local changedsize = 1 * Options.prosize.Value
								v.Size = Vector3.new(changedsize, changedsize, changedsize)
							end
						end
					elseif string.find(v.Name, "Paintball") then
						if v.ClassName == "Part" then
							for i = 1, math.random(2, 10) do
								local changedsize = 1 * Options.prosize.Value
								v.Size = Vector3.new(changedsize, changedsize, changedsize)
							end
						end
					elseif string.find(v.Name, "Superball") then
						if v.ClassName == "Part" then
							for i = 1, math.random(2, 10) do
								local changedsize = 2 * Options.prosize.Value
								v.Size = Vector3.new(changedsize, changedsize, changedsize)
							end
						end
					end
				end
			end)
		end
	})

	Slider:SetValue(1)
	
	local Keybind = Tabs.Settings:AddKeybind("Bmove", {
		Title = "Bomb-Move",
		Mode = "Hold",
		Default = "LeftControl",
	})

	task.spawn(function()
		while true do
			wait()

			local state = Keybind:GetState()
			local part = playerFolder:FindFirstChild(Players.LocalPlayer.Name .. "'s Bomb")
	
			if state then
				if part and part:IsA("Part") then
					local tweenInfo = TweenInfo.new( 
						0.1,  
						Enum.EasingStyle.Linear, 
						Enum.EasingDirection.Out
					)
					
					local tween = TweenService:Create(part, tweenInfo, { CFrame = mouse.Hit * CFrame.new(0, 2, 0) }) 
					tween:Play()
					part.Anchored = true
					--[[
						part.Rotation = Vector3.new(math.random(0, 360), math.random(0, 360), math.random(0, 360))
					]]
					
				end
			else
				if part and part:IsA("Part") then
					part.Anchored = false
				end
			end
			
			if Fluent.Unloaded then break end
		end
	end)

	Keybind:SetValue("LeftControl", "Hold")
	
	_G.JaGhwopen = true
	Tabs.Settings:AddButton({
		Title = "Click-Explode",
		Description = "Click anywhere and it will explode!, cooldown of 7 seconds.",
		Callback = function()
			if Players.LocalPlayer.Backpack:FindFirstChild("Rocket") then
				EquipTool("Rocket", Vector3.new(1000, 250, 0), false, false)
				_G.JaGhwopen = true
				playerFolder.ChildAdded:Connect(function(rocket)
					if rocket:IsA("Part") and rocket.Name == Players.LocalPlayer.Name.."'s Rocket" then
						if Players.LocalPlayer.Character:FindFirstChild("Rocket").GripPos ~= Vector3.new(-0.578999996, -0.596000016, 0.074000001, -0.000692009926, 0.00872156397, 0.999961734, -0.0214206018, 0.999732375, -0.00873438641, -0.999770284, -0.0214258246, -0.000504970551) then
							rocket.CFrame = mouse.Hit
							for io = 1, 10 do
								wait()
								rocket.Rotation = Vector3.new(math.random(0, 1080), math.random(0, 1080), math.random(0, 1080))
							end 
						end
					end
				end)
				
				--[[ --insta ranged weapon travel :D cant believe i accidentally made this lol
				playerFolder.ChildAdded:Connect(function(rocket)
					if rocket:IsA("Part") then
						for io = 1, 25 do
							wait()
							rocket.CFrame = mouse.Hit
							rocket.Rotation = Vector3.new(math.random(0, 1080), math.random(0, 1080), math.random(0, 1080))
						end
					end
				end)
				]]
			else
				EquipTool("Rocket", Vector3.new(0, 0, 0), false, true)
				_G.JaGhwopen = false
			end
		end
	})

	Tabs.Settings:AddSection("Other")

	local Toggle = Tabs.Settings:AddToggle("de", {Title = "Detect exploiters V0.42", Default = false })
	_G.SaidAdmin = ""
	Toggle:OnChanged(function()
		if Options.de.Value == true then
			local function de()
				while Options.de.Value == true do
					local Players = game:GetService("Players")
					for _, player in ipairs(Players:GetPlayers()) do
						local character = player.Character
						if character then
							local repsoncesXD = {player.DisplayName.. " is exploiting and luckly your script is better then his!! :)", player.DisplayName.. " is exploiting 😪", player.DisplayName.. " is 'hacking', bro is NOT him XD", player.DisplayName.. " is exploiting, blud is using IY LMAO"}
							local humanoid = character:FindFirstChildOfClass("Humanoid")
							if humanoid then
								_G.DEoldknstats = game.Players[player.name].leaderstats.Knockouts.Value
								--[[
								local bru = character:FindFirstChild("HumanoidRootPart")
								if bru then
									_G.DEoldcoords = bru.Position
								end
								]]
								wait(0.25)
								if player.Name ~= Players.LocalPlayer.Name then
									if humanoid:GetState() == Enum.HumanoidStateType.Swimming or humanoid:GetState() == Enum.HumanoidStateType.Flying or humanoid:GetState() == Enum.HumanoidStateType.PlatformStanding then-- 2p
										Fluent:Notify({
											Title = "Exploiter Detected",
											Content = "Reason = Flying",
											SubContent = repsoncesXD[math.random(1, 4)],
											Duration = 12 - math.random(1, 11)
										})
									elseif game.Players[player.name].leaderstats.Knockouts.Value - _G.DEoldknstats >= 3 then-- 2p
										Fluent:Notify({
											Title = "Exploiter Detected",
											Content = "Reason = Kill all :O",
											SubContent = repsoncesXD[math.random(1, 4)],
											Duration = 12 - math.random(1, 11)
										})
									end
								end
							end
						end 
					end
				end
			end
			de()
		end
	end)

	Options.de:SetValue(false)

	local Toggle = Tabs.Settings:AddToggle("da", {Title = "Detect admins V0.45", Default = false })
	Toggle:OnChanged(function()
		if Options.da.Value == true then
			local function da()
				while Options.da.Value == true do
					local Players = game:GetService("Players")
					for _, player in ipairs(Players:GetPlayers()) do
						local character = player.Character
						if character then
							local repsoncesXD = {player.DisplayName.. " is an admin., PLEASE use your scripts CAREFULLY!!", player.DisplayName.. " is an admin., They might be here for you.", player.DisplayName.. " is an admin., PLEASE use your scripts CAREFULLY!!"}
							local humanoid = character:FindFirstChildOfClass("Humanoid")
							if humanoid then
								wait(0.06)
								if table.find(knownadminslist, player.name) then --1p
									if _G.SaidAdmin ~= player.Name then
										_G.SaidAdmin = player.Name
										Fluent:Notify({
											Title = "Admin Detected.",
											Content = "Reason = Known Admin.",
											SubContent = repsoncesXD[math.random(1, 3)],
											Duration = 12 - math.random(1, 11)
										})
									end
								else
									local nospawn = false
									if game.Players[player.name].Team == "Spectators" then -- 2p
										for _, AllSpires in pairs(game.Workspace.Doomspires:GetChildren()) do
											for _, v in pairs(AllSpires:GetChildren()) do
												if v:FindFirstChild("Spawnpoints") then
													nospawn = true
												end
											end
										end
										if nospawn == false then
											if _G.SaidAdmin ~= player.Name then
												_G.SaidAdmin = player.Name
												Fluent:Notify({
													Title = "Admin Detected.",
													Content = "Reason = Switching Teams.",
													SubContent = repsoncesXD[math.random(1, 3)],
													Duration = 12 - math.random(1, 11)
												})
											end
										end
									end
								end
							end
						end 
					end
				end
			end
			da()
		end
	end)

	Options.da:SetValue(false)
	
	Tabs.Settings:AddSection("Options")
	
	local Toggle = Tabs.Settings:AddToggle("aetool", {Title = "Auto Equip Tool On Spawn (Kill All)", Default = false })
	Toggle:OnChanged(function()
		if Options.aetool.Value == true then
			game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
				if Options.aetool.Value == true then
					EquipTool(_G.KAGmode, "", true)
				end
			end)
		end
	end)
	
	Tabs.Settings:AddButton({
		Title = "Disable Bomb",
		Description = "Disable your placed bomb",
		Callback = function()
			for _, v in pairs(playerFolder:GetChildren()) do
				if string.find(v.Name, "Bomb") or v.Name == "deactivebomb" then
					if v:IsA("Folder") then
						v.BlownUpClient.Value = true
						v.Name = "Folder"
					elseif v:IsA("Part") then
						v.Transparency = 0.1
					end
					
					if v.Name == "deactivebomb" then
						v.CFrame = CFrame.new(0, -1000, 0) 
						wait(0.5) 
						v:Destroy()
					else
						v.Name = "deactivebomb"
					end
				end
			end
		end
	})
end



loaded = true
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)


SaveManager:LoadAutoloadConfig()
