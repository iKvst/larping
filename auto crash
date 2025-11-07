--[[
    skidded by yours truly <3
]]

-- //

game:GetService("StarterGui"):SetCore("SendNotification",{Title="Ultra Speed Loaded",Text="Optimized by fearyourdestiny. Running...",Icon="rbxassetid://12345678",Duration=3})

local p,lp,t,h=game:GetService("Players"),game.Players.LocalPlayer,game:GetService("TeleportService"),game:GetService("HttpService")
local pr=workspace:FindFirstChild("__REMOTES")and workspace.__REMOTES:FindFirstChild("Game")and workspace.__REMOTES.Game:FindFirstChild("Pets")

local function inv()
	local g=lp:FindFirstChild("PlayerGui")
	return g and g:FindFirstChild("Inventory") and g.Inventory:FindFirstChild("Frame") and g.Inventory.Frame:FindFirstChild("Pets")
end

local function spawn()
	local i=inv() if not i or not pr then return end
	for _,pl in pairs(p:GetPlayers())do local t=pl.Character and pl.Character:FindFirstChild("UpperTorso")
		if t then for _,f in pairs(i:GetChildren())do
			if f:IsA("Frame")then pr:FireServer({{{"Spawn",lp,f.Name},{"PetMovement",lp,f.Name,t,false}}})end
		end end
	end
end

local function hop()
	local id,c,l=game.PlaceId,"",{}
	local req=(syn and syn.request or request)
	for _=1,5 do
		local ok,res=pcall(function()return req({Url="https://games.roblox.com/v1/games/"..id.."/servers/Public?sortOrder=Asc&limit=100&cursor="..c,Method="GET"})end)
		if ok and res and res.StatusCode==200 then
			local d=h:JSONDecode(res.Body) for _,s in ipairs(d.data)do
				if s.playing<s.maxPlayers and s.id~=game.JobId then table.insert(l,s.id)end
			end c=d.nextPageCursor or"" if c==""then break end
		end task.wait()
	end
	if #l>0 then t:TeleportToPlaceInstance(id,l[math.random(1,#l)])end
end

local mt=getrawmetatable(game)setreadonly(mt,false)local old=mt.__namecall
mt.__namecall=newcclosure(function(...)local a={...}
	if getnamecallmethod()=="Kick"and a[1]==lp then hop()return wait(9e9)end
	return old(...)
end)setreadonly(mt,true)

for _=1,12 do task.spawn(function()while task.wait(0.001)do spawn()end end)end
task.spawn(function()while true do pcall(hop)task.wait(8)end end)
