ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local wait = false

ESX.RegisterServerCallback('info', function(source, cb, target)
        local xPlayer = ESX.GetPlayerFromId(target)
        local identifier = GetPlayerIdentifiers(target)[1]
        local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", { ['@identifier'] = identifier })
        
        local playpos = GetEntityCoords(PlayerPedId())

        local user      	= result[1]
        local firstname     = user['firstname']
        local lastname      = user['lastname']
        local phone			= user['phone_number']
            
        local data = {
            firstname = firstname,
            lastname = lastname,
            phone = phone,
            playerpos = playerpos
        }
    cb(data)
end)  

RegisterCommand('pnum', function(source, args) -- Registers the command
    if wait == false then
    TriggerClientEvent("chat:phonenum", -1, source, GetPlayerName(source), table.concat(args, " "))
    wait = true
    Citizen.Wait(20000)
    wait = false
    elseif wait == true then
    TriggerClientEvent("chat:phonewait", -1, source, GetPlayerName(source), table.concat(args, " "))
    end
end)
