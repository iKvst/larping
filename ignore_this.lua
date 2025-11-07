local dir = require(game.ReplicatedStorage['1 | Directory']).Pets

local fn = function(number)
    local formatted = tostring(number)
    local k
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if k == 0 then
            break
        end
    end
    return formatted
end

warn'----'

local festivePets = {}
for id, name in pairs({
    [77002] = 'Festive Dragon',
    [76004] = 'Festive Racoon',
    [76001] = 'Festive Cat',
    [76002] = 'Festive Dog',
    [79003] = 'Festive C0RE',
    [79001] = 'Festive Immortuos',
    [78002] = 'Gingerbread',
    [78003] = 'Reindeer',
    [77001] = 'Festive Seal',
    [76003] = 'Festive Bunny',
    [78004] = 'Festive Dominus',
    [78005] = 'Randolph',
    [79002] = 'Festive C0RE',
    [77004] = 'Ice Spike',
    [78001] = 'Festive Ame Damnee'
}) do
    festivePets[name] = true
end

local excludedGlitchPets = {
    "Dominus Huge",
    "Hydra",
    "Chimera",
    "Aesthetic Cat",
    "Spike",
    "Magic Fox"
}

for _, user in pairs(game.Players:GetChildren()) do
    for i, v in pairs(workspace.__REMOTES.Core['Get Other Stats']:InvokeServer()[user.Name].Save.Pets) do
        local multi = v.g and 3 or v.r and 6 or v.dm and 18 or 1
        local h = v.dm and v.r and 'Glitched ' or v.dm and 'DM ' or v.r and 'Rainbow ' or v.g and 'Gold ' or 'Regular '
        
        local maxLevel = dir[v.n].Level[2] * multi + 100000
        local petName = dir[v.n].DisplayName

        if v.rb and v.dm then
            local isExcluded = false
            for _, excludedPet in ipairs(excludedGlitchPets) do
                if petName == excludedPet then
                    isExcluded = true
                    break
                end
            end

            if not isExcluded then
                print(user.Name .. ' has a LVL ' .. fn(v.l) .. ' Glitched ' .. petName .. ' (Max Level: ' .. fn(maxLevel) .. ')')
            end
        end

        if festivePets[petName] and (v.g or v.dm or not v.r) and v.l >= maxLevel and v.n ~= "17009" then
            print(user.Name .. ' has a LVL ' .. fn(v.l) .. ' ' .. h .. petName .. ' (Max Level: ' .. fn(maxLevel) .. ')')
        elseif not festivePets[petName] and v.l >= maxLevel and v.n ~= "17009" then
            print(user.Name .. ' has a LVL ' .. fn(v.l) .. ' ' .. h .. petName .. ' (Max Level: ' .. fn(maxLevel) .. ')')
        end
    end
end
