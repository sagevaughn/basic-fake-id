-- server.lua

local fakeIDs = {}

RegisterCommand("changefakeid", function(source, args)

    local newName = table.concat(args, " ")

    if newName == nil or newName == "" then
        TriggerClientEvent("chat:addMessage", source, {
            args = { "^1SYSTEM", "Usage: /changefakeid Firstname Lastname" }
        })
        return
    end

    fakeIDs[source] = {
        name = newName,
        dob = "03/14/1998",
        occupation = "Mechanic",
        citizenid = "LS-" .. math.random(10000,99999)
    }

    TriggerClientEvent("chat:addMessage", source, {
        args = { "^2SYSTEM", "Fake ID updated to: " .. newName }
    })

end)

RegisterCommand("showid", function(source)

    if not fakeIDs[source] then
        fakeIDs[source] = {
            name = GetPlayerName(source),
            dob = "03/14/1998",
            occupation = "Mechanic",
            citizenid = "LS-" .. math.random(10000,99999)
        }
    end

    TriggerClientEvent("rp:idcard", source, fakeIDs[source])

end)

AddEventHandler("playerDropped", function()
    fakeIDs[source] = nil
end)