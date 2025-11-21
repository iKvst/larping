local OpenEgg = workspace.__REMOTES.Game["Open Egg"] -- RemoteEvent 

-- This data was received from the server
firesignal(OpenEgg.OnClientEvent, 
    "Snake", -- egg type
    {
        {
            cn = "Peanut",
            id = 11790463,
            e = false,
            l = 999999, -- lvl
            xp = 25990,
            n = "90011" -- id from dir
        }
    }
)
