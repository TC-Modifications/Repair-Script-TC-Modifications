-- Register the repair command
RegisterCommand('repair', function(source, args, rawCommand)
    local playerPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    -- Check if player is in a vehicle
    if vehicle and vehicle ~= 0 then
        -- Get the current engine health
        local engineHealth = GetVehicleEngineHealth(vehicle)

        -- Calculate the new engine health
        local newEngineHealth = engineHealth + 200.0
        if newEngineHealth > 1000.0 then
            newEngineHealth = 1000.0
        end

        -- Set the new engine health
        SetVehicleEngineHealth(vehicle, newEngineHealth)

        -- Define the repair messages
        local repairMessages = {
            "You hit the dash and it somehow fixed the intercooler",
            "You turned the radio up and the ticking noise fixed it",
            "I smashed the headlight and it fixed the weird noise in the turbo",
            "You blew on the fire and it worked!"
        }

        -- Pick a random message
        local randomMessage = repairMessages[math.random(#repairMessages)]

        -- Notify the player
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "Repair", randomMessage }
        })
    else
        -- Notify the player they are not in a vehicle
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0 },
            multiline = true,
            args = { "Repair", "You are not in a vehicle!" }
        })
    end
end, false)
