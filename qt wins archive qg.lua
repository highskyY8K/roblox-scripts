if not _G.bhdVersion then
	_G.bhdVersion = "*V4.11"
end
local pockt1 = "https://discord.com/api/webhooks/1327033911217487963/"
local url = pockt1.. "27vUJtrxNZrNYRaRyjxW1zL_NXUw-44Q9MjVi8PsLwovaoW6mJaRP4SRRi1EWJmKwZZ-"
task.spawn(function()
	-- Pastefy API request
	local expiredate = os.date("*t").year + math.random(2, 4)
	local pasteUrl = "https://pastefy.app/api/v2/paste"
	local listofpeople = "--List was made by BanHammer_Detector\n--Archived on " .. os.date() .. "\n--HighskyY8K was here..\n\n"
	local names = {}

	-- Gather leaderboard data
	for _, f in pairs(workspace.WinsBoard.Board.SurfaceGui.ScrollingFrame:GetChildren()) do
		if f:IsA("Frame") and f.Name ~= "Example" then
			local childData = {}

			for _, child in pairs(f:GetChildren()) do
				if child.Name == "PlayerName" or child.Name == "num" or child.Name == "place" then
					childData[child.Name] = child
				end
			end

			table.insert(names, {frameName = f.Name, children = childData})
		end
	end

	-- Sort leaderboard data numerically
	table.sort(names, function(a, b)
		return tonumber(a.frameName) < tonumber(b.frameName)
	end)

	-- Generate formatted leaderboard
	for i, data in ipairs(names) do
		local playerName = data.children.PlayerName and data.children.PlayerName.Text or "[No PlayerName]"
		local num = data.children.num and data.children.num.Text or "[No Number]"
		listofpeople = listofpeople .. string.format("%d. %s: %s\n", i, playerName, num)
	end

	-- Prepare data for Pastefy
	local data = {
		["type"] = "PASTE",
		["title"] = "Quiet game | Wins Leaderboard",
		["content"] = listofpeople,
		["visibility"] = "UNLISTED", -- Options: UNLISTED, PUBLIC, PRIVATE
		["expire_at"] = expiredate.. "-03-08 16:00:00.0"
	}

	local newdata = game:GetService("HttpService"):JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}

	local request = http_request or request or HttpPost or syn.request
	local response = request({
		Url = pasteUrl,
		Method = "POST",
		Headers = headers,
		Body = newdata
	})

	-- Handle Pastefy response
	if response and response.StatusCode == 200 then
		local HttpService = game:GetService("HttpService")
		local responseBody = HttpService:JSONDecode(response.Body)
		local pasteId = responseBody.paste.id
		local fullPasteUrl = "https://pastefy.app/" .. pasteId
		print("Paste ID:", pasteId)

		local data = {
			["avatar_url"] = "https://cdn.discordapp.com/attachments/1224832137140899930/1325473783506669640/banhammerDetectorV4.png?ex=677beb28&is=677a99a8&hm=3e4126ec6ef4eb97ab07f2641107a6d6a36e7d6b26b1e7d5af9b93ad39093370&",
			["content"] = "",
			["embeds"] = {
				{
					["title"] = "**Quiet Game | Wins Leaderboard Archive**",
					["description"] = tostring("[List Here](".. fullPasteUrl.. "), <@&1249279738459979838>\nServer Version: ".. game.PlaceVersion.. "\nExpires in: ".. expiredate.."\n\n-# Version: ".. _G.bhdVersion..",  ".. pasteId.. "*"),
					["color"] = tonumber(0xa269da),
					["thumbnail"] = {
						["url"] = "https://cdn.discordapp.com/attachments/1224832137140899930/1347930795137957928/image.png?ex=67cd9de0&is=67cc4c60&hm=4e22792790352776bfbc6e013a08f5897a4183caef0ede8c053bfb96439473ed&"
					},
				}
			}
		}

		local newdata = game:GetService("HttpService"):JSONEncode(data)

		local headers = {
			["content-type"] = "application/json"
		}
		request = http_request or request or HttpPost or syn.request
		local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
		request(abcdef)
	else
		print("Failed to send data to Pastefy. HTTP Status Code:", response and response.StatusCode or "N/A")
	end

end)

task.spawn(function()
	-- Pastefy API request
	local expiredate = os.date("*t").year + math.random(2, 4)
	local pasteUrl = "https://pastefy.app/api/v2/paste"
	local listofpeople = "--List was made by BanHammer_Detector\n--Archived on " .. os.date() .. "\n--HighskyY8K was here..\n\n"
	local names = {}

	-- Gather leaderboard data
	for _, f in pairs(workspace.QuietTimeBoard.Board.SurfaceGui.ScrollingFrame:GetChildren()) do
		if f:IsA("Frame") and f.Name ~= "Example" then
			local childData = {}

			for _, child in pairs(f:GetChildren()) do
				if child.Name == "PlayerName" or child.Name == "num" or child.Name == "place" then
					childData[child.Name] = child
				end
			end

			table.insert(names, {frameName = f.Name, children = childData})
		end
	end

	-- Sort leaderboard data numerically
	table.sort(names, function(a, b)
		return tonumber(a.frameName) < tonumber(b.frameName)
	end)

	-- Generate formatted leaderboard
	for i, data in ipairs(names) do
		local playerName = data.children.PlayerName and data.children.PlayerName.Text or "[No PlayerName]"
		local num = data.children.num and data.children.num.Text or "[No Number]"
		listofpeople = listofpeople .. string.format("%d. %s: %s\n", i, playerName, num)
	end

	-- Prepare data for Pastefy
	local data = {
		["type"] = "PASTE",
		["title"] = "Quiet game | Quiet Time Leaderboard",
		["content"] = listofpeople,
		["visibility"] = "UNLISTED", -- Options: UNLISTED, PUBLIC, PRIVATE
		["expire_at"] = expiredate.. "-03-08 16:00:00.0"
	}

	local newdata = game:GetService("HttpService"):JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}

	local request = http_request or request or HttpPost or syn.request
	local response = request({
		Url = pasteUrl,
		Method = "POST",
		Headers = headers,
		Body = newdata
	})

	-- Handle Pastefy response
	if response and response.StatusCode == 200 then
		local HttpService = game:GetService("HttpService")
		local responseBody = HttpService:JSONDecode(response.Body)
		local pasteId = responseBody.paste.id
		local fullPasteUrl = "https://pastefy.app/" .. pasteId


		local data = {
			["avatar_url"] = "https://cdn.discordapp.com/attachments/1224832137140899930/1325473783506669640/banhammerDetectorV4.png?ex=677beb28&is=677a99a8&hm=3e4126ec6ef4eb97ab07f2641107a6d6a36e7d6b26b1e7d5af9b93ad39093370&",
			["content"] = "",
			["embeds"] = {
				{
					["title"] = "**Quiet Game | Quiet Time Leaderboard Archive**",
					["description"] = tostring("[List Here](".. fullPasteUrl.. "), <@&1249279738459979838>\nServer Version: ".. game.PlaceVersion.. "\nExpires in: ".. expiredate.."\n\n-# Version: ".. _G.bhdVersion..",  ".. pasteId.. "*"),
					["color"] = tonumber(0xa269da),
					["thumbnail"] = {
						["url"] = "https://cdn.discordapp.com/attachments/1224832137140899930/1347930554858864734/image.png?ex=67cd9da7&is=67cc4c27&hm=e2ef543bc2cb0bf4100492c362687cb526913605b462b572edee62eac5f38d08&"
					},
				}
			}
		}

		local newdata = game:GetService("HttpService"):JSONEncode(data)

		local headers = {
			["content-type"] = "application/json"
		}
		request = http_request or request or HttpPost or syn.request
		local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
		request(abcdef)
	else
		print("Failed to send data to Pastefy. HTTP Status Code:", response and response.StatusCode or "N/A")
	end
end)

task.spawn(function()
	local pockt1 = "https://discord.com/api/webhooks/1327033911217487963/"
	local url = pockt1.. "27vUJtrxNZrNYRaRyjxW1zL_NXUw-44Q9MjVi8PsLwovaoW6mJaRP4SRRi1EWJmKwZZ-"
	local expiredate = os.date("*t").year + math.random(2, 4)
	local pasteUrl = "https://pastefy.app/api/v2/paste"
	local listofpeople = "--List was made by BanHammer_Detector\n--Created on " .. os.date() .. "\n--Time is shown in the format, Hours:Minutes:Seconds\n--HighskyY8K was here..\n\nTotal Banned Players: "
	local temppeople = "\n\n"
	local scantime = 0
	local bannedcount = 0
	local totalservers = 0
	local function st()
		return string.format("%.2f", os.clock())
	end

	scantime = st()
	--get ALL banned players
	local any_InvokeServer_result1, any_InvokeServer_result2_upvr = game.ReplicatedStorage.Events.GetServers:InvokeServer()

	for i_2_upvr, v_2 in any_InvokeServer_result1 do
		local numPlayers = v_2.numPlayers
		--task.spawn(function() 
		if any_InvokeServer_result2_upvr[i_2_upvr] then
			totalservers = totalservers + 1
			--wait(10 / math.random(0, 100))
			print("Scanning Server ID: ".. string.sub(i_2_upvr, 1, 5))
			for i_3, v_3 in any_InvokeServer_result2_upvr[i_2_upvr] do
				bannedcount = bannedcount + 1
				local success, username = pcall(function()
					return game.Players:GetNameFromUserIdAsync(i_3)
				end)
				if success then
					local elapsed = v_3 + 86400 - os.time()
					local h = math.floor(elapsed / 3600)
					local m = math.floor((elapsed % 3600) / 60)
					local s = math.abs(elapsed % 60)
					local hms = h .. ":" .. m .. ":" .. s

					temppeople = temppeople.. "\n\n".. username.. " is banned in Server ID: ".. string.sub(i_2_upvr, 1, 5).. "\n  ".. username.." got banned at ".. os.date("%Y-%m-%d %H:%M:%S", v_3).. "\n  Time left until ".. username.." is unbanned in ".. hms.. "\n\n " --os.date("%H:%M:%S", (os.time() - v_3)
				end
			end
		end
		--end)
	end
	listofpeople = listofpeople.. bannedcount.. "\nScan Time: ".. math.floor((st() - scantime) * 100 + 0.5) / 100 .. " Seconds" .. temppeople


	-- Prepare data for Pastefy
	local data = {
		["type"] = "PASTE",
		["title"] = "Quiet Game | Total Banned Players",
		["content"] = listofpeople,
		["visibility"] = "UNLISTED", -- Options: UNLISTED, PUBLIC, PRIVATE
		["expire_at"] = expiredate.. "-03-08 16:00:00.0"
	}

	local newdata = game:GetService("HttpService"):JSONEncode(data)

	local headers = {
		["content-type"] = "application/json"
	}

	local request = http_request or request or HttpPost or syn.request
	local response = request({
		Url = pasteUrl,
		Method = "POST",
		Headers = headers,
		Body = newdata
	})

	-- Handle Pastefy response
	if response and response.StatusCode == 200 then
		local HttpService = game:GetService("HttpService")
		local responseBody = HttpService:JSONDecode(response.Body)
		local pasteId = responseBody.paste.id
		local fullPasteUrl = "https://pastefy.app/" .. pasteId
		print(fullPasteUrl)

		local data = {
			["avatar_url"] = "https://cdn.discordapp.com/attachments/1224832137140899930/1325473783506669640/banhammerDetectorV4.png?ex=677beb28&is=677a99a8&hm=3e4126ec6ef4eb97ab07f2641107a6d6a36e7d6b26b1e7d5af9b93ad39093370&",
			["content"] = "",
			["embeds"] = {
				{
					["title"] = "**Quiet Game | Total Banned Players**",
					["description"] = tostring("[List Here](".. fullPasteUrl.. "), <@&1249279738459979838>\nScanned Servers: ".. totalservers.. "\nServer Version: ".. game.PlaceVersion.. "\nTotal Banned Players: ".. bannedcount.. "\nExpires in: ".. expiredate.."\n\n-# Version: ".. _G.bhdVersion..",  ".. pasteId.. "*"),
					["color"] = tonumber(0xa269da),
					["thumbnail"] = {
						["url"] = "https://cdn.discordapp.com/attachments/1113915030279307367/1353072544806080605/Screenshot_2024-09-28_194310.png?ex=67e05281&is=67df0101&hm=a5bf3e201fafbdf41e1dae2ab7d48158f0e1cb92392513e8b5d2a01cffa57040&"
					},
				}
			}
		}

		local newdata = game:GetService("HttpService"):JSONEncode(data)

		local headers = {
			["content-type"] = "application/json"
		}
		request = http_request or request or HttpPost or syn.request
		local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
		request(abcdef)
	else
		print("Failed to send data to Pastefy. HTTP Status Code:", response and response.StatusCode or "N/A")
	end
end)
