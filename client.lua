ESX								= nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function fuckoff()
    ESX.TriggerServerCallback('info', function(data)
        local firstname = nil
        local lastname = nil
        local phone = nil

        if data.firstname ~= nil then
            firstname = data.firstname
        else
            firstname = 'Unknown'
        end
        if data.lastname ~= nil then
            lastname = data.lastname
        else
            lastname = 'Unknown'
        end                              
        if data.phone ~= nil then        
            phone = data.phone           
        else                             
            phone = 'Unknown'             
        end     
    end, GetPlayerServerId(i))
end

RegisterNetEvent('chat:phonenum')
AddEventHandler('chat:phonenum', function(id, name, message)
    local player = GetPlayerFromServerId(serverId)
    local playerPed = GetPlayerPed(player)
    local ped = PlayerPedId()
    local dist = #(GetEntityCoords(playerPed) - GetEntityCoords(ped))
    if dist <= 19.999 or player == PlayerId() then
        fuckoff()
        TriggerEvent('chatMessage', "", {0, 128, 255}, firstname.." "..lastname.. "| "..phone) -- Outputs message to players near sending client
    end
end)

RegisterNetEvent('chat:phonewait')
AddEventHandler('chat:phonewait', function(id, name, message)
    TriggerEvent('chatMessage', "", {255, 0, 0}, "Don't spam that command! ")
end)
