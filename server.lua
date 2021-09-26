ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


----- ATTENTION
----- Pour le cmd = '' il ne faut pas mettre + de 5 charactères




RegisterCommand("ano", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local src = source
    local msg = rawCommand:sub(5)
    local args = msg
    if player ~= false then
        local name = GetPlayerName(source)
        local xPlayers	= ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], "Anonyme", '~b~Annonce', ''..msg..'', 'DIA_VICTIM', 8)
    end
   
        

end, false)




local max = 'Oui'
local resultat = {}
RegisterNetEvent('swann_twtname')
AddEventHandler('swann_twtname', function(nom)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(source)

	MySQL.Async.execute('INSERT INTO twt_names (identifier, nom, max) VALUES (@identifier, @nom, @max)', {
        ['@identifier'] = xPlayer.identifier,
        ['@nom'] = nom,
        ['@max'] = max,
        
    },function()
        
    end)
    TriggerClientEvent('result', src, resultat)
 
end)

RegisterServerEvent('swann_supprimertwt')
AddEventHandler('swann_supprimertwt', function ()
    local src = source
	local xPlayer = ESX.GetPlayerFromId(source)
  		MySQL.Async.execute(
			'DELETE FROM twt_names WHERE (identifier = @identifier)',
			{
				['@identifier'] = xPlayer.identifier
			}
		)
        

end)


RegisterNetEvent('swann_affichernom')
AddEventHandler('swann_affichernom', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.fetchAll('SELECT * FROM twt_names WHERE (identifier = @identifier)', {
        ['@identifier'] = xPlayer.identifier,
    }, function(result)
        if result[1] ~= nil then 
            resultat = result
        else
            resultat = result
            TriggerClientEvent('result2', src, resultat)
        end
        TriggerClientEvent('result', src, resultat)
    end)
end)

RegisterNetEvent('swann_tweeter')
AddEventHandler('swann_tweeter', function(name,msg)
    local src = source
	local args = msg
    if player ~= false then
        local xPlayers	= ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
                local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
                local name = GetPlayerName(source)
                
                    TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Twitter', ''..name..'', ''..msg..'', 'CHAR_SWANN', 0)
        end
           
    end
end)



