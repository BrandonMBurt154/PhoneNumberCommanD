wait = false

RegisterCommand('p#', function(source, args)
    if wait == false then
        TriggerServerEvent('DisplayPhone', args)
        wait = true
        Citizen.Wait(20000)
        wait = false
    elseif wait == true then
        TriggerServerEvent('WaitDisplay', args)
    end
end
