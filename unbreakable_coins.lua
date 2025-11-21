local h=Instance.new("Hint",game.CoreGui)h.Text="Coins: ∞"
local r=workspace.__REMOTES local p=r.Core["Get Stats"]:InvokeServer().Save.Pets[1].id
for _,v in pairs(workspace.__THINGS.Coins:GetChildren())do local n=v:FindFirstChild("CoinName")
if n and n.Value~=""then r.Game.Coins:FireServer("Mine",v.Name,math.huge*1e300,p)
local b=v:FindFirstChild("ProgressBillboard")if b then b:Destroy()end
r.Game.Coins:FireServer("StopMine",v.Name)end end
