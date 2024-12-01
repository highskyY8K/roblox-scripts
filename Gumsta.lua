local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "Gumstra V0.4",
	SubTitle = "by highskyY8K",
	TabWidth = 150,
	Size = UDim2.fromOffset(580, 360),
	Acrylic = false, -- if true it breaks the weapons making it unusable
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
		Title = "warning",
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
	local Players = game:GetService("Players")
	local playerNames = {}
	
	
	local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
		Title = "Teleports",
		Values = playerNames,

		Multi = false,
		Default = 1,
	})

	Dropdown:OnChanged(function(Value)
		for _, player in ipairs(Players:GetPlayers()) do 
			table.insert(playerNames, player.DisplayName)
			
		end
		
		for _, GetplrName in pairs(Players:GetPlayers()) do
			if GetplrName.DisplayName == Value then
				local plHRP = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
				plHRP.CFrame = GetplrName.Character:WaitForChild("HumanoidRootPart").CFrame
			end
		end
	end)
	
	Dropdown:SetValue(Players.LocalPlayer.DisplayName)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
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

	Tabs.Player:AddSection("External scripts")

	Tabs.Player:AddButton({
		Title = "IY",
		Description = "Execute Infinite yield",
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
		end
	})
	
	Tabs.Player:AddSection("Other")
	
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
	
	Tabs.Player:AddSection(" ")
	
	local Slider = Tabs.Player:AddSlider("instakillpower", {
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
	
	local Toggle = Tabs.Player:AddToggle("instakillsword", {Title = "Insta-Kill Sword", Default = false })

	Toggle:OnChanged(function()
		local function runAV()
			while Options.instakillsword.Value == true do
				local character = game.Players.LocalPlayer.Character
				local sword = character:FindFirstChild("Sword")
				
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
	
	Tabs.Settings:AddSection("Other")
	
	local Toggle = Tabs.Settings:AddToggle("de", {Title = "Detect exploiters", Default = false })

	Toggle:OnChanged(function()
		if Options.de.Value == true then
			local function de()
				while Options.de.Value == true do
					local Players = game:GetService("Players")
					for _, player in ipairs(Players:GetPlayers()) do
						local character = player.Character
						if character then
							local humanoid = character:FindFirstChildOfClass("Humanoid")
							if humanoid then
								if humanoid:GetState() == Enum.HumanoidStateType.Swimming or humanoid:GetState() == Enum.HumanoidStateType.Flying then
									Fluent:Notify({
										Title = "Exploiter Detected",
										Content = "",
										SubContent = player.DisplayName.. " is exploiting and luckly your script is better then his!! :)",
										Duration = 12
									})
								end
							end
						end
						wait(1 / math.random(2, 10))
					end
				end
			end
			de()
		end
	end)

	Options.de:SetValue(false)
	
end






-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)


-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
