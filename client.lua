ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
		ESX.PlayerData = ESX.GetPlayerData()
	end
end)

local cooldown = false
local maximum 
local nomchoisi
local notif = true
function MenuTwt()
    
    local sMenuTwt = RageUI.CreateMenu("Twitter",' ')
    sMenuTwt:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuTwt, not RageUI.Visible(sMenuTwt))
    
    TriggerServerEvent('swann_affichernom')
    
    while sMenuTwt do
        
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuTwt, true, true,true, function()
        

            
        
        if maximum ~= 'Oui' then  
            RageUI.ButtonWithStyle("÷ Twitter - ~b~ Nom d'utilisateur ",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                
                if (Selected) then
                    local nomsaisi = KeyboardInput("Saisir le nom", "Exemple : Swann", 15)
                    TriggerServerEvent('swann_twtname',nomsaisi)
                    TriggerServerEvent('swann_affichernom')
                    ExecuteCommand("twt")
                    ExecuteCommand("twt")
                    
                end
            end)
            RageUI.ButtonWithStyle("÷ Twitter -~r~ Envoyer un tweet",nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                    
                end
            end)
        else
            RageUI.ButtonWithStyle("÷ Twitter - ~b~ Nom d'utilisateur : ~y~"..nomchoisi,nil, {RightBadge = RageUI.BadgeStyle.Lock }, false, function(Hovered, Active, Selected)
                if (Selected) then
                    
                end
            end)
           
            

                RageUI.ButtonWithStyle("÷ Twitter - ~g~ Envoyer un tweet",nil, {RightLabel = "→"}, not cooldown, function(Hovered, Active, Selected)
                    if (Selected) then
                        local msg = KeyboardInput("Saisir le message", "Exemple : Bonjour Twitter", 100)
                        TriggerServerEvent('swann_tweeter',nomchoisi,msg)
                        cooldown = true
                        if cooldown then
                            Citizen.SetTimeout(10000, function()
                                cooldown = false
                                
                            end) 
                        end
                        
                    end
                end)
                RageUI.ButtonWithStyle("÷ Twitter - ~r~ Supprimer le compte",nil, {RightLabel = "→"},true, function(Hovered, Active, Selected)
                    if (Selected) then
                        MenuConfirm()
                    end
                end)
                   
        end   
        end, function()
        end)
        if not RageUI.Visible(sMenuTwt) then
            sMenuTwt = RMenu:DeleteType("Twitter", true)
        end
        
    end
end



RegisterCommand('twt', function()
    MenuTwt()
 end, false)


function MenuConfirm()
    local sMenuConfirm = RageUI.CreateMenu("Twitter", "Confirmation de supression")
    sMenuConfirm:SetRectangleBanner(0, 0, 0, 255)
    RageUI.Visible(sMenuConfirm, not RageUI.Visible(sMenuConfirm))
    while sMenuConfirm do 
        Citizen.Wait(0)
        RageUI.IsVisible(sMenuConfirm, true, true,true, function()
            
            RageUI.ButtonWithStyle("÷ Twitter - ~g~ Confirmer supression : ~y~"..nomchoisi,nil, {RightLabel = "→"}, not cooldown, function(Hovered, Active, Selected)
                if (Selected) then
                    TriggerServerEvent('swann_supprimertwt')
                    TriggerServerEvent('swann_affichernom')
                    ExecuteCommand("twt")
                    ExecuteCommand("twt")
                    
                   
                    
                end
            end)
            
            RageUI.ButtonWithStyle("÷ Twitter - ~r~ Revenir en arrière",nil, {RightLabel = "→"}, not cooldown, function(Hovered, Active, Selected)
                if (Selected) then
                    MenuTwt()
                    
                   
                    
                end
            end)
        
            end, function()
            end)
        if not RageUI.Visible(sMenuConfirm) then
           sMenuConfirm = RMenu:DeleteType("Twitter", true)
        end
    end
end




 function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)


    AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult() 
        Citizen.Wait(500) 
        blockinput = false
        return result 
    else
        Citizen.Wait(500) 
        blockinput = false 
        return nil 
    end
end


RegisterNetEvent('result')
AddEventHandler('result', function(result)
    
    for index,data in pairs(result) do
        nomchoisi = data.nom
        maximum = data.max
    end
    
    
end)

RegisterNetEvent('result2')
AddEventHandler('result2', function(result)
    
    nomchoisi = nil
    maximum = 'Non'
    
end)

function RegisterCommandKey(action, description, defaultKey, callback)
    RegisterKeyMapping(action, description, 'keyboard', defaultKey)
    RegisterCommand(action, function()
        callback()
    end, false)
end

RegisterCommandKey("Twitter", "Ouvrir twitter", "j", function()
   MenuTwt()
end)