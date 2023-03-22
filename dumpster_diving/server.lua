ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dumpster:giveItemToPlayer')
AddEventHandler('dumpster:giveItemToPlayer', function(itemName)
  local xPlayer = ESX.GetPlayerFromId(source)
  xPlayer.addInventoryItem(itemName, 1)
end)

RegisterNetEvent('dumpster:giveWeaponToPlayer')
AddEventHandler('dumpster:giveWeaponToPlayer', function(weaponName)
  local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 500)
end)
