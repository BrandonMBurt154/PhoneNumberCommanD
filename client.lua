wait = false

RegisterCommand('p#', function(source, args) -- Registers command that will display phone number locally in chat
    if wait == false then
        TriggerServerEvent('DisplayPhone', args)
        wait = true
        Citizen.Wait(20000) -- Time out on the command that stops people from spamming it 
        wait = false
    elseif wait == true then
        TriggerEvent('chatMessage', "", {255, 0, 0}, "Don't Spam Pwease >_<" ) -- Client side chat message displayed if player attempts to repeat the command during the time out
	end
end
