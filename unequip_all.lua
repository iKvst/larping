local Players = game:GetService("Players")
local Debris = workspace:WaitForChild("__DEBRIS")
local PetsFolder = Debris:WaitForChild("Pets")
local Remotes = workspace:WaitForChild("__REMOTES")
local GameRemotes = Remotes:WaitForChild("Game")
local PetsRemote = GameRemotes:WaitForChild("Pets")

local function removePlayerPets(player)
local playerFolder = PetsFolder:FindFirstChild(player.Name)
if playerFolder then
for _, pet in ipairs(playerFolder:GetChildren()) do
local args = {
{
{
"Remove",
player,
pet.Name
}
}
}
PetsRemote:FireServer(unpack(args))
end
end
end

Players.PlayerAdded:Connect(function(player)
wait()
removePlayerPets(player)
end)

spawn(function()
while true do
for _, player in ipairs(Players:GetPlayers()) do
removePlayerPets(player)
end
wait()
end
end)
