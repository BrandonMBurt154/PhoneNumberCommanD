ESX								= nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.TriggerServerCallback('info', function(data)
    local firstname = nil
    local lastname = nil
    local phone = nil
    if data.firstname ~= nil then
        firstname = data.firstname
    else
        firstname = 'Unknow'
    end
    if data.lastname ~= nil then
        lastname = data.lastname
    else
        lastname = 'Unknow'
    end                              
    if data.phone ~= nil then        
        phone = data.phone           
    else                             
        phone = 'Unknow'             
    end                              
end)

RegisterNetEvent('chat:phonenum')
AddEventHandler('chat:phonenum', function(id, name, message)
    local myId = PlayerId() 
    local otherID = GetPlayerFromServerId(id) 
    if otherID == myId then -- checks to see if player is in range of own messages idk why broke if it wasnt there
        TriggerEvent('chatMessage', "", {255, 0, 0}, firstname.." "..lastname.. "| "..phone) -- Outputs message to sending client 
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(otherID)), true) < 19.999 then -- checks for players within range
        TriggerEvent('chatMessage', "", {0, 128, 255}, firstname.." "..lastname.. "| "..phone) -- Outputs message to players near sending client
    end
end)