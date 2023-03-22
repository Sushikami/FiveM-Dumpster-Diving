local dumpsterChecked = {}

-- Get closest dumpster object
Citizen.CreateThread(function()
  while true do Citizen.Wait(500)
    local playerPed = PlayerPedId()
    playCoords = GetEntityCoords(playerPed)

    for k,v in pairs(Config.DumpsterHashes) do
      new_handle = GetClosestObjectOfType(playCoords, 0.85, v, false, false, false)

      if new_handle ~= nil and new_handle ~= 0 then
        handle = new_handle
        dumpsterCoord = GetEntityCoords(handle)
        break
      end
    end

    if new_handle ~= handle then
      handle = nil
    end
  end
end)

-- main loop
Citizen.CreateThread(function()
  while true do Citizen.Wait(0)
    if handle ~= nil and handle ~= 0 and not dumpsterChecked[handle] then
      DrawText3D(dumpsterCoord.x, dumpsterCoord.y, dumpsterCoord.z + 1, "Flex [E] to check trash", 255, 255, 255)
      if IsControlJustReleased(0, 38) then
        local playerPed = PlayerPedId()
        if not IsPedInAnyVehicle(playerPed, true) then
          dumpsterChecked[handle] = true

          local randomItem = Config.Items[math.random(1, #Config.Items)]

          FreezeEntityPosition(playerPed, true)
          TriggerEvent('move_set:disableemotes', true)

          TriggerEvent("emote:play", "mechanic3")
          print("Scrounging for scraps")

          Citizen.Wait(Config.SearchDuration)
          TriggerEvent("emote:play", "c")

          FreezeEntityPosition(playerPed, false)
          TriggerEvent('move_set:disableemotes', false)

          if feeling_lucky(randomItem.multiplier) then
            if randomItem.type == 'item' then
              TriggerServerEvent('dumpster:giveItemToPlayer', randomItem.name)
            elseif randomItem.type == 'weapon' then
              TriggerServerEvent('dumpster:giveWeaponToPlayer', randomItem.name)
            end
          else
            TriggerEvent("emote:play", "damn")
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do Citizen.Wait(Config.DumpsterRefillCooldown)
    dumpsterChecked = {} -- Clear searched dumpsters
  end
end)

-- Chance Function
function feeling_lucky(multiplier)
  for i=1, multiplier, 1 do
    local rand = math.random(1,100)
    if rand > 50 then
      return false
    end
  end

  return true
end

-- Draw text in 3D space
function DrawText3D(x, y, z, text, r, g, b)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())
  local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

  local scale = (1/dist)
  local fov = (1/GetGameplayCamFov())*100
  local scale = scale*fov

  if onScreen then
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(r, g, b, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
  end
end

-- Chance Tester
-- Citizen.CreateThread(function()
--   local success_total = 0
--   local tries_total = 0
--   while true do Citizen.Wait(0)
--     local tries = 1
--
--     while not feeling_lucky(4) do
--       tries = tries + 1
--       tries_total = tries_total + 1
--     end
--
--     if tries == 1 then
--       success_total = success_total + 1
--     end
--
--     print("Chance: "..success_total.."/"..tries_total)
--   end
-- end)
