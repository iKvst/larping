local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to spawn pets for all players except yourself
local function spawnAllPets()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then  -- Skip local player
            -- Get player's pets
            local success, playerData = pcall(function()
                return workspace.__REMOTES.Core['Get Other Stats']:InvokeServer()[player.Name]
            end)
            
            if success and playerData and playerData.Save and playerData.Save.Pets then
                for _, pet in ipairs(playerData.Save.Pets) do
                    local args = {
                        {
                            {
                                "Spawn",
                                player,
                                pet.id
                            },
                            {
                                "PetMovement",
                                player,
                                pet.id,
                                player.Character and player.Character:FindFirstChild("UpperTorso"),
                                false
                            }
                        }
                    }
                    
                    -- Fire instantly without delay
                    workspace:WaitForChild("__REMOTES"):WaitForChild("Game"):WaitForChild("Pets"):FireServer(unpack(args))
                end
                print("Spawned all pets for " .. player.Name)
            end
        end
    end
    print("Spawned all pets for everyone except yourself!")
end

-- Execute the function 9990 times instantly
for i = 1, 9990 do
    spawnAllPets()
end

print("Executed pet spawning 9990 times!")
