RegisterCommand('destek', function(source, args, rawCommand)
    local id = tonumber(args[1])

    if id then
        TriggerServerEvent('destek:requestSupport', id)
    else
        TriggerEvent('chat:addMessage', {
            color = Config.ErrorColor,
            multiline = true,
            args = { Config.InvalidIDMessage }
        })
    end
end)

RegisterNetEvent('destek:showSupportMessage')
AddEventHandler('destek:showSupportMessage', function(playerName)
    TriggerEvent('chat:addMessage', {
        color = Config.SuccessColor,
        args = { Config.SupportMessage, 'Oyuncu ' .. playerName .. ' için destek talebi oluşturuldu.' }
    })
end)
