

function onLogin(cid)
	local storage = 87778
   local config = {
     voc_items = {
       { -- SORC
         {2190}, -- wand of vortex
       },
       { -- DRUID
         {2182}, -- snakebite rod
       },
       { -- PALADIN
         {2410}, -- throwing knife
       },
       { -- KNIGHT
         {8602}, -- jagged sword
       }
     },
     all_items = {
       {2478}, -- brass legs
       {2643}, -- leather boots
       {2465}, -- brass armor
       {2509}, -- steel shield
       {2480}, -- legion helmet
     },
     extra_items = {
       {2789, 15},
	   {2152, 30},
	   {2389, 5},
       {2120},
       {2554},
     },
     knight_weapons = {
       {2439}, -- daramanian mace
       {8601}, -- steel axe
     }
   }
   if getPlayerGroupId(cid) < 6 then
     if getPlayerStorageValue(cid, storage) == -1 then
       local common = config.voc_items[getPlayerVocation(cid)]
       if common ~= nil then
         for _, v in ipairs(common) do
           doPlayerAddItem(cid, v[1], v[2] or 1)
         end
       end
       
       local all = config.all_items
       if all ~= nil then
         for _, v in ipairs(all) do
           doPlayerAddItem(cid, v[1], v[2] or 1)
         end
       end
       
       local extra = config.extra_items
       local bp = doPlayerAddItem(cid, 1988, 1)
       if extra ~= nil then
         for _, v in ipairs(extra) do
           doAddContainerItem(bp, v[1], v[2] or 1)
         end
       end
       
       local weapons = config.knight_weapons
       if weapons ~= nil then
         for _, w in ipairs(weapons) do
           if isKnight(cid) then
             doAddContainerItem(bp, w[1], w[2] or 1)
           end
         end
       end
       
       setPlayerStorageValue(cid, storage, 1)
     end
   end
   return true
end