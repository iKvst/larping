--[[
    skidded by yours truly <3
]]

-- //

--// Services
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

--// Settings
local COMPACT_MESSAGES = false
local MOBILE_FRIENDLY = true
local ONLY_30_PERCENT = true
local TAG_EVERYONE = true
local WEBHOOK_URL = " "
local AVATAR_THUMBNAIL = "https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png"
local OVERCAP_THRESHOLD = 1.30
local MIN_OVERCAP = 300000

--// Directories
local dir = require(game.ReplicatedStorage['1 | Directory']).Pets

--// Pet images
local PET_IMAGES = {
    Glitched = "https://cdn.discordapp.com/attachments/1338179958379384862/1396114299994505327/file_0000000090b8620a9c59039caa6a8f1e_1.png",
    DM = "https://cdn.discordapp.com/attachments/1338179958379384862/1395399667365187675/Untitled49_20250717163448.png",
    Rainbow = "https://cdn.discordapp.com/attachments/1338179958379384862/1395399668011372584/Untitled49_20250717163353.png",
    Gold = "https://cdn.discordapp.com/attachments/1338179958379384862/1395399668409700434/Untitled49_20250717162925.png",
    Regular = "https://cdn.discordapp.com/attachments/1338179958379384862/1395399668900429934/Untitled49_20250717162620.png",
}

--// Blacklists
local BLACKLISTED_PETS = {
    ["Zombie Cat"] = true,
    ["CORE SHOCK"] = function(petData) return petData.r end,
    ["Hydra"] = function(petData) return petData.r end,
    ["Agony"] = function(petData) return petData.r or petData.dm end,
    ["Mortuus"] = function(petData) return petData.r end,
    ["Dominus HeadStack"] = function(petData) return petData.g end,
    ["Willow Wisp"] = function(petData) return petData.r end,
    ["Noob"] = true,
    ["Dominus Electric"] = function(petData) return petData.r end,
    ["Dog"] = true,
    ["Cat"] = true,
    ["Zombie Dog"] = true,
    ["Skeleton"] = true,
    ["Aesthetic Cat"] = function(petData) return petData.r end,
    ["CORE"] = function(petData) return petData.r end,
    ["Red Snake"] = true,
    ["Spike"] = function(petData) return petData.r or petData.dm end,
    ["Dominus Huge"] = function(petData) return true end,
    ["C0RE SH0CK"] = function(petData) return petData.r end
}
local PLAYER_BLACKLIST = {
    ["1krnll"] = true, ["marecek2306"] = true, ["lucas1524868"] = true,
    ["BOB123eabc"] = true, ["MalevolentObserver"] = true,
    ["neverfe4rt"] = true, ["KatharsisTK3"] = true, ["eddehalloween"] = true,
    ["BLOCK_DAVlD"] = true, ["eric889"] = true, ["vaIkerian"] = true,
    ["Sijwen0"] = true, ["Account_Indo"] = true, ["chammy0947y"] = true,
    ["Vika_Vika251"] = true, ["cin2r012"] = true, ["Armes_playing"] = true
}
local excludedGlitchPets = { "Dominus Huge", "Hydra", "Chimera", "Aesthetic Cat", "Magic Fox", "Spike" }

--// Utils
local function formatNumber(number)
    return tostring(number):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

local function generateJoinScript()
    if MOBILE_FRIENDLY then
        return string.format('game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s", game:GetService("Players").LocalPlayer)', game.PlaceId, game.JobId)
    else
        return string.format([[
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
TeleportService:TeleportToPlaceInstance(%d, "%s", Players.LocalPlayer)
        ]], game.PlaceId, game.JobId)
    end
end

--// Webhook sender
local function sendWebhook(playerName, userId, petLevel, petType, petName, maxLevel, detectionType)
    if PLAYER_BLACKLIST[playerName] then return end
    local joinScript = generateJoinScript()
    local description
    
    if COMPACT_MESSAGES then
        description = string.format("**%s** has suspicious %s %s (Lvl: %s)", playerName, petType, petName, formatNumber(petLevel))
    else
        description = string.format("**%s** has a super rare pet!\n", playerName)
        if detectionType == "percentage" then
            description = description .. string.format("**Detection Method:** 30%% over max level (%.2fx)\n", petLevel / maxLevel)
        elseif detectionType == "glitched" then
            description = description .. "**Detection Method:** Glitched variant (DM + RB)\n"
        else
            description = description .. "**Detection Method:** Standard overcap (300k+)\n"
        end
    end

    local embed = {
        title = "Super Rare Pet Detected!",
        description = description .. (COMPACT_MESSAGES and "" or "\nExecute this script in the game to join:"),
        color = 0x00FF00,
        fields = {
            {
                name = "Pet Details",
                value = string.format("**Type:** %s\n**Name:** %s\n**Level:** %s\n**Max Level:** %s", petType, petName, formatNumber(petLevel), formatNumber(maxLevel)),
                inline = true
            }
        },
        thumbnail = { url = string.format(AVATAR_THUMBNAIL, userId) },
        image = { url = PET_IMAGES[petType:match("^%w+")] or PET_IMAGES.Regular },
        footer = { text = os.date("%X • %x") }
    }

    if not COMPACT_MESSAGES then
        table.insert(embed.fields, { name = "Join", value = MOBILE_FRIENDLY and joinScript or string.format("```lua\n%s\n```", joinScript), inline = false })
        table.insert(embed.fields, { name = "Serv Info", value = string.format("**Place ID:** %d\n**Server ID:** %s", game.PlaceId, game.JobId), inline = false })
    end

    local data = { embeds = {embed}, username = "fear's slave", content = TAG_EVERYONE and "@everyone" or nil }
    pcall(function()
        HttpService:RequestAsync({ Url = WEBHOOK_URL, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = HttpService:JSONEncode(data) })
    end)
end

--// Blacklist check
local function isPetBlacklisted(petName, petData)
    for blacklistedName, rule in pairs(BLACKLISTED_PETS) do
        if petName:lower() == blacklistedName:lower() then
            if type(rule) == "function" then
                local success, result = pcall(rule, petData)
                return success and result
            end
            return rule
        end
    end
    return false
end

--// ServerHop system
local retryDelay = 2
local function getServers()
    local list, cur = {}, ""
    repeat
        local url = "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?limit=100"..(cur ~= "" and "&cursor="..cur or "")
        local success, result = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)
        if success and result and result.data then
            for _, v in pairs(result.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    table.insert(list, v.id)
                end
            end
            cur = result.nextPageCursor
        else
            cur = nil
        end
    until not cur or #list >= 10
    return list
end
local function serverHop()
    local servers = getServers()
    if #servers > 0 then
        local serverId = servers[math.random(1, #servers)]

        -- queue on teleport
        if syn and syn.queue_on_teleport then
            syn.queue_on_teleport(game:HttpGet(game:GetService("Players").LocalPlayer.PlayerGui:GetFullName())) -- placeholder
        elseif queue_on_teleport then
            queue_on_teleport([[
                loadstring(game:HttpGet("]]..WEBHOOK_URL..[["))()
            ]])
        end

        TeleportService:TeleportToPlaceInstance(game.PlaceId, serverId, localPlayer)
    else
        warn("No servers found, retrying...")
        task.delay(retryDelay, serverHop)
    end
end
TeleportService.TeleportInitFailed:Connect(function(_, teleportResult, errorMessage)
    warn("Teleport failed:", teleportResult, errorMessage)
    task.delay(retryDelay, serverHop)
end)

--// Main checker
local foundGoodPet = false
local function checkPlayersPets()
    foundGoodPet = false
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and not PLAYER_BLACKLIST[player.Name] then
            local success, stats = pcall(function()
                if workspace.__REMOTES and workspace.__REMOTES.Core and workspace.__REMOTES.Core['Get Other Stats'] then
                    local result = workspace.__REMOTES.Core['Get Other Stats']:InvokeServer()
                    return result and result[player.Name] and result[player.Name].Save and result[player.Name].Save.Pets
                end
                return nil
            end)

            if success and stats then
                for _, v in pairs(stats) do
                    local multi = v.g and 3 or v.r and 6 or v.dm and 18 or 1
                    local petType = v.dm and v.r and 'Glitched' or v.dm and 'DM' or v.r and 'Rainbow' or v.g and 'Gold' or 'Regular'
                    local petName = dir[v.n] and dir[v.n].DisplayName or v.n
                    local baseMaxLevel = dir[v.n] and dir[v.n].Level[2] * multi or 0
                    local maxLevel = baseMaxLevel + MIN_OVERCAP

                    if isPetBlacklisted(petName, v) then continue end

                    if v.dm and v.r and not table.find(excludedGlitchPets, petName) then
                        sendWebhook(player.Name, player.UserId, v.l, "Glitched", petName, maxLevel, "glitched")
                        foundGoodPet = true
                    end

                    if v.l >= (baseMaxLevel * OVERCAP_THRESHOLD) and v.l >= MIN_OVERCAP then
                        sendWebhook(player.Name, player.UserId, v.l, petType, petName, baseMaxLevel, "percentage")
                        foundGoodPet = true
                    elseif not ONLY_30_PERCENT and v.l >= maxLevel and v.n ~= "17009" then
                        sendWebhook(player.Name, player.UserId, v.l, petType, petName, maxLevel, "standard")
                        foundGoodPet = true
                    end
                end
            end
        end
    end
end

--// Loop
while true do
    local success, err = pcall(checkPlayersPets)
    if not success then warn("Error in checkPlayersPets:", err) end

    if not foundGoodPet then
        serverHop()
        break
    end
    task.wait(60)
end
