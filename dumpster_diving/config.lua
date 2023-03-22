Config = {}

Config.SearchDuration = 10 * 1000 -- 10 seconds

Config.DumpsterRefillCooldown = 30 * 60000 -- 30 minutes

Config.DumpsterHashes = {
  -- Dumpsters
  666561306, 218085040, -58485588,

  -- Bins
  -1096777189, -228596739, 1614656839, -2096124444, 1329570871, 651101403, 1437508529,

  -- Trashbags
  600967813, -1681329307, 1098827230, 1388308576, 1948359883,
}

-- Item Types: Item or Weapon
-- Chance multiplier is exponential:
Config.Items = {
  { name = "bread", type = "item", multiplier = 1 },
  { name = "water", type = "item", multiplier = 1 },
  { name = "phone", type = "item", multiplier = 2 },
  { name = "bread", type = "item", multiplier = 2 },
  { name = "water", type = "item", multiplier = 2 },
  { name = "phone", type = "item", multiplier = 3 },
  { name = "lockpick", type = "item", multiplier = 2 },
  { name = "fixkit", type = "item", multiplier = 3 },
  { name = "weaclip", type = "item", multiplier = 3 },
  { name = "bulletproof", type = "item", multiplier = 3 },
  { name = "WEAPON_WRENCH", type = "weapon", multiplier = 3 },
  { name = "WEAPON_SWITCHBLADE", type = "weapon", multiplier = 3 },
  { name = "WEAPON_PISTOL", type = "weapon", multiplier = 3 },
  { name = "euphoriatoken", type = "item", multiplier = 4 },
  { name = "skindeluxe", type = "item", multiplier = 6 }, -- almost impossible
}
