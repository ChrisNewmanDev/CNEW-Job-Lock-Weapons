QBCore = exports['qb-core']:GetCoreObject()

weaponblacklist = Config.weapons

-- CODE --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        playerPed = GetPlayerPed(-1)
		Player = QBCore.Functions.GetPlayerData()
		if playerPed then
            nothing, weapon = GetCurrentPedWeapon(playerPed, true)

            job = getPlayerJob()
            if not isJobWhitelisted(job) then
                if disableallweapons then
                    RemoveAllPedWeapons(playerPed, true)
                else
                    if isWeaponBlacklisted(weapon) then
                        RemoveWeaponFromPed(playerPed, weapon)
                        --sendForbiddenMessage (Config.Message)
						exports['okokNotify']:Alert('PD Weapon', Config.Message, 5000, 'warning', true)
                    end
                end
            end
        end
    end
end)

function isWeaponBlacklisted(model)
    for _, blacklistedWeapon in pairs(weaponblacklist) do
        if model == GetHashKey(blacklistedWeapon) then
            return true
        end
    end

    return false
end

function getPlayerJob()
    local xPlayer = QBCore.Functions.GetPlayerData()
    if xPlayer and xPlayer.job and xPlayer.job.name then
        return xPlayer.job.name
    else
        return Config.BasicJob
    end
end

function isJobWhitelisted(job)
    local whitelistedJobs = Config.Jobs 

    for _, whitelistedJob in pairs(whitelistedJobs) do
        if job == whitelistedJob then
            return true
        end
    end

    return false
end