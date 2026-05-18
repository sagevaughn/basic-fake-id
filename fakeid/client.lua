-- client.lua

RegisterNetEvent("rp:idcard")
AddEventHandler("rp:idcard", function(data)

    SetNuiFocus(true, false)

    SendNUIMessage({
        action = "open",
        name = data.name,
        dob = data.dob,
        occupation = data.occupation,
        citizenid = data.citizenid
    })

end)