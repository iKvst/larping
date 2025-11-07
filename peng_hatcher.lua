--[[
    skidded by yours truly <3
]]

-- //

 local Settings = {
    DeleteClientUpdater = true,
    Combine = false,
    Tier = "Christmas Tier 4", -- "Tier 1-18 and Christmas Tier 1-4"
    Whitelist = {
        "Giant Penguin"
    }
}
local Lib = {
    [77002] = 'Festive Dragon',
    [9004] = 'Wavy Cheeta',
    [7004] = 'Dragon',
    [8004] = 'Demon',
    [5004] = 'Bat',
    [6004] = 'Ladybug',
    [3004] = 'Pig',
    [4004] = 'Seal',
    [1004] = 'Lamb',
    [2004] = 'Mouse',
    [16012] = 'Cyborg Dominus',
    [16009] = 'Cyborg Demon',
    [77003] = 'Snow Spike',
    [15005] = 'Green Gummy Bear',
    [13007] = 'Space Dragon',
    [10004] = 'Electric Slime',
    [66002] = 'Zombie Dog',
    [15006] = 'Yellow Gummy Bear',
    [15008] = 'Rainbow',
    [16002] = 'Cyborg Dog',
    [12003] = 'Angel',
    [13001] = 'Alien',
    [15009] = 'Dark Candy Corn',
    [17003] = 'Dominus Noob',
    [66003] = 'Spider',
    [12007] = 'Mortuus',
    [12005] = 'Ice Queen',
    [11004] = 'Lava Watermelon',
    [76004] = 'Festive Racoon',
    [66004] = 'Pumpkin',
    [16006] = 'Red Space Ranger',
    [16001] = 'Cyborg Cat',
    [11002] = 'Sherbert',
    [76001] = 'Festive Cat',
    [66001] = 'Zombie Cat',
    [79003] = 'Giant Penguin',
    [15007] = 'Cookie',
    [1001] = 'Cat',
    [3001] = 'Dalmatian',
    [2001] = 'Brown Cat',
    [5001] = 'Owl',
    [4001] = 'Koala',
    [7001] = 'Watermelon',
    [6001] = 'Cheeta',
    [9001] = 'Fantasy Dragon',
    [8001] = 'Bomb',
    [66006] = 'Ghostdeeri',
    [12004] = 'Fire King',
    [90003] = 'Red Snake',
    [78002] = 'Gingerbread',
    [17006] = 'Dominus Damnee',
    [10003] = 'Lava Turtle',
    [15001] = 'Candy Cane',
    [18002] = 'Spike',
    [17009] = 'Dominus Huge',
    [14005] = 'Space Bear',
    [2005] = 'White Bunny',
    [1005] = 'Orange Cat',
    [10002] = 'Lava Dalmatian',
    [8005] = 'Cyclops',
    [9005] = 'Wavy Tiger',
    [4005] = 'Racoon',
    [3005] = 'Panda',
    [13004] = 'Space Cat',
    [5005] = 'Bee',
    [18006] = 'Agony',
    [18001] = 'Aesthetic Cat',
    [13002] = 'Puffer',
    [10001] = 'Lava Zebra',
    [17007] = 'Dominus Rainbow',
    [90001] = 'BIG Maskot',
    [11005] = 'Wavy Bee',
    [10006] = 'Dominus Messor',
    [14004] = 'Space Cyclops',
    [17001] = 'Dominus Pumpkin',
    [12002] = 'Reaper',
    [2002] = 'White Cat',
    [3002] = 'Bear',
    [4002] = 'Crocodile',
    [5002] = 'Monkey',
    [6002] = 'Tiger',
    [7002] = 'Yeti',
    [8002] = 'Ghost',
    [9002] = 'Cherry Bomb',
    [11006] = 'Unicorn',
    [90010] = 'Huge Cat',
    [15004] = 'Green Lollipop',
    [16011] = 'C0RE SH0CK',
    [90008] = 'Noob',
    [1002] = 'Dog',
    [12006] = 'Immortuos',
    [90009] = 'Love Cat',
    [14009] = '1NE',
    [76002] = 'Festive Dog',
    [90006] = 'Dominus Partner',
    [90005] = 'Wavy Snake',
    [16004] = 'Cyborg',
    [90004] = 'Purple Snake',
    [10008] = 'Dominus Empyreus',
    [90002] = 'Green Snake',
    [79002] = 'Festive C0RE',
    [13003] = 'Wooga',
    [79001] = 'Festive Immortuos',
    [78005] = 'Randolph',
    [78004] = 'Festive Dominus',
    [12001] = 'Tank',
    [78003] = 'Reindeer',
    [78001] = 'Festive Ame Damnee',
    [18004] = 'Chimera',
    [77001] = 'Festive Seal',
    [13005] = 'Space Dog',
    [76003] = 'Festive Bunny',
    [90007] = 'Love Dog',
    [66010] = 'Skeleton Ghost',
    [66009] = 'Willow Wisp Green',
    [66008] = 'Willow Wisp',
    [66007] = 'Sorrow',
    [66005] = 'Skeleton',
    [18005] = 'Hydra',
    [77004] = 'Ice Spike',
    [18003] = 'Magic Fox',
    [17008] = 'Dominus Electric',
    [17005] = 'Dominus HeadStack',
    [13006] = 'Space Bunny',
    [16005] = 'Space Ranger',
    [17002] = 'Dominus Cherry',
    [16010] = 'C0RE',
    [16008] = 'RoVer',
    [16007] = 'Friendly Cyborg',
    [17004] = 'Dominus Wavy',
    [14002] = 'HeadStack',
    [16003] = 'Computer',
    [15011] = 'Domortuus',
    [15010] = 'Ame Damnee',
    [15003] = 'Red Lollipop',
    [15002] = 'Candy Corn',
    [10007] = 'Dominus Frigidus',
    [14008] = 'ZER0',
    [6003] = 'Zebra',
    [5003] = 'Turtle',
    [4003] = 'Platypus',
    [3003] = 'Polar Bear',
    [2003] = 'White Dog',
    [1003] = 'Bunny',
    [14007] = 'Dark Saturn',
    [10005] = 'Electric Ghost',
    [14006] = 'Saturn',
    [14003] = 'Space Owl',
    [14001] = 'Revurse',
    [11003] = 'Robot',
    [11001] = 'Zombie',
    [9003] = 'Wavy Zebra',
    [8003] = 'Cherry Monkey',
    [7003] = 'Slime'
}
Lib[5042847] = 'Pet Cloner' -- Add the GamePass ID and a name for the pet cloner

isWhitelisted = function(id)
    return table.find(Settings.Whitelist, Lib[id])
end

if Settings.DeleteClientUpdater then
    game.Players.LocalPlayer.PlayerGui.Events:ClearAllChildren()
end

GetStats = function()
    return workspace.__REMOTES.Core["Get Other Stats"]:InvokeServer()[game.Players.LocalPlayer.Name]
end

combine = function()
    local Stats = GetStats()
    local GT, RT, DMT = {}, {}, {}

    for _,Pet in pairs(Stats.Save.Pets) do
        local Type = Pet.n
        if isWhitelisted(tonumber(Type)) then
            if not (Pet.g or Pet.r or Pet.dm) then
                if GT[Type] then
                    GT[Type] = GT[Type] + 1
                else
                    GT[Type] = 1
                end
            elseif Pet.g and not (Pet.r or Pet.dm) then
                if RT[Type] then
                    RT[Type] = RT[Type] + 1
                else
                    RT[Type] = 1
                end
            elseif Pet.r and not (Pet.g or Pet.dm) then
                if DMT[Type] then
                    DMT[Type] = DMT[Type] + 1
                else
                    DMT[Type] = 1
                end
            end
        end
    end

    for PetN,Amount in pairs(GT) do
        if Amount >= 10 then
            for _,Pet in pairs(Stats.Save.Pets) do
                if tostring(Pet.n) == tostring(PetN) and not (Pet.g or Pet.r or Pet.dm) and Amount >= 10 then
                    workspace.__REMOTES.Game["Golden Pets"]:InvokeServer(Pet.id)
                    Amount = 0
                end
            end
        end
    end

    for PetN,Amount in pairs(RT) do
        if Amount >= 7 then
            for _,Pet in pairs(Stats.Save.Pets) do
                if tostring(Pet.n) == tostring(PetN) and Pet.g and not (Pet.r or Pet.dm) and Amount >= 7 then
                    workspace.__REMOTES.Game["Rainbow Pets"]:InvokeServer(Pet.id)
                    Amount = 0
                end
            end
        end
    end

    for PetN,Amount in pairs(DMT) do
        if Amount >= 5 then
            for _,Pet in pairs(Stats.Save.Pets) do
                if tostring(Pet.n) == tostring(PetN) and Pet.r and not (Pet.g or Pet.dm) and Amount >= 5 then
                    workspace.__REMOTES.Game["Dark Matter Pets"]:InvokeServer(Pet.id)
                    Amount = 0
                end
            end
        end
    end

    -- Add logic for the "Pet Cloner" GamePass here
    if Stats.Save.Passes[5042847] then
        local petClonerAmount = Stats.Save.Passes[5042847]
        for _,Pet in pairs(Stats.Save.Pets) do
            if Pet.n == 5042847 and petClonerAmount >= 3 then
                for i = 1, 3 do
                    workspace.__REMOTES.Game["Pet Cloner"]:InvokeServer(Pet.id)
                    petClonerAmount = petClonerAmount - 3
                end
            end
        end
    end
end
if Settings.Combine then
    spawn(function()
        while wait() do
            combine()
        end
    end)
end

repeat
    wait()
    local Save = GetStats().Save
    local numberOfPetsToBuy = (Save.PetSlots - #Save.Pets)
    local toDeletePets = {}
    local wentThrough = 0

    for i = 1, numberOfPetsToBuy do
        spawn(function()
            local _,pet = workspace.__REMOTES.Game.Shop:InvokeServer("Buy", "Eggs", Settings.Tier)

            if pet and not isWhitelisted(tonumber(pet[1][1].n)) then
                table.insert(toDeletePets, pet[1][1].id)
            end
            wentThrough = wentThrough + 1
        end)
    end

    repeat
        wait()
    until wentThrough == numberOfPetsToBuy

    workspace.__REMOTES.Game.Inventory:InvokeServer("MultiDelete", toDeletePets)
until false
