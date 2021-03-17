
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    
ESX.RegisterServerCallback('info', function(source, cb, target)
        local xPlayer = ESX.GetPlayerFromId(target)
        local identifier = GetPlayerIdentifiers(target)[1]
        local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier })
            
        local user      	= result[1]
        local firstname     = user['firstname']
        local lastname      = user['lastname']
        local phone			= user['phone_number']
            
        local data = {
            firstname = firstname,
            lastname = lastname,
            phone = phone,
        }
    cb(data)
end) 
    
TriggerEvent('es:addCommand', 'p#', function(source, args, user)
    table.remove(args, 1)
    local source = tonumber(source)
    TriggerClientEvent("chat:phonenum", -1, source, GetPlayerName(source), table.concat(args, " "))
end)
