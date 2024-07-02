RegisterServerEvent('destek:requestSupport')
AddEventHandler('destek:requestSupport', function(targetId)
    local sourcePlayer = source
    local sourcePlayerName = GetPlayerName(sourcePlayer)
    local targetPlayerName = GetPlayerName(targetId)

    TriggerClientEvent('destek:receiveSupportRequest', targetId, sourcePlayerName)
    
    -- Loglama
    local logMessage = string.format("%s tarafından %s için destek talebi oluşturuldu.", sourcePlayerName, targetPlayerName)
    TriggerEvent('destek:logSupportRequest', logMessage)
end)

RegisterNetEvent('destek:logSupportRequest')
AddEventHandler('destek:logSupportRequest', function(message)
    local logContent = string.format("[SUPPORT] %s", message)
    
    if Config.LogToFile then
        -- Dosyaya loglama
        local logFile = io.open(Config.LogFile, 'a')
        if logFile then
            logFile:write(logContent .. '\n')
            logFile:close()
        end
    else
        -- Konsola loglama
        print(logContent)
    end
end)
