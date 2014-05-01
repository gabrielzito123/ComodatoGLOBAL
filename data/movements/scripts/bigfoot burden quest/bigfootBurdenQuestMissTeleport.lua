local destination = {
d1 = { tele = {x = 33003, y = 31918, z = 10}, tele2 = {x = 33008, y = 31921, z = 10} },
d2 = { tele = {x = 33007, y = 31921, z = 10}, tele2 = {x = 33002, y = 31918, z = 10} },
d3 = { tele = {x = 32993, y = 31913, z = 12}, tele2 = {x = 32995, y = 31917, z = 12} },
d4 = { tele = {x = 32995, y = 31916, z = 12}, tele2 = {x = 32993, y = 31912, z = 12} },
d5 = { tele = {x = 33011, y = 31936, z = 11}, tele2 = {x = 33014, y = 31934, z = 11} },
d6 = { tele = {x = 33013, y = 31934, z = 11}, tele2 = {x = 33013, y = 31936, z = 11} },
d7 = { tele = {x = 32996, y = 31923, z = 10}, tele2 = {x = 33013, y = 31881, z = 9} },
d8 = { tele = {x = 33011, y = 31944, z = 11}, tele2 = {x = 33019, y = 31887, z = 9} },
d9 = { tele = {x = 32989, y = 31908, z = 12}, tele2 = {x = 33021, y = 31902, z = 9} },
d10 = { tele = {x = 33122, y = 31976, z = 10}, tele2 = {x = 33017, y = 31872, z = 9} },
d11 = { tele = {x = 33128, y = 31964, z = 11}, tele2 = {x = 33025, y = 31884, z = 9} }
--, d12 = { tele = {x = 32989, y = 31908, z = 1}, tele2 = {x = 33029, y = 31900, z = 9} }
}


function onStepIn(cid, item, position, lastPosition)
		local p = Player(cid)
		local aid = destination[item.actionid]
		
		if position.x == destination.d1.tele.x and position.y == destination.d1.tele.y and position.z == destination.d1.tele.z then
			p:teleportTo(destination.d1.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		
		elseif position.x == destination.d2.tele.x and position.y == destination.d2.tele.y and position.z == destination.d2.tele.z then
			p:teleportTo(destination.d2.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		elseif position.x == destination.d3.tele.x and position.y == destination.d3.tele.y and position.z == destination.d3.tele.z then
			p:teleportTo(destination.d3.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		elseif position.x == destination.d4.tele.x and position.y == destination.d4.tele.y and position.z == destination.d4.tele.z then
			p:teleportTo(destination.d4.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		elseif position.x == destination.d5.tele.x and position.y == destination.d5.tele.y and position.z == destination.d5.tele.z then
			p:teleportTo(destination.d5.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		
		elseif position.x == destination.d6.tele.x and position.y == destination.d6.tele.y and position.z == destination.d6.tele.z then
			p:teleportTo(destination.d6.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		elseif position.x == destination.d7.tele.x and position.y == destination.d7.tele.y and position.z == destination.d7.tele.z then
			p:teleportTo(destination.d7.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		elseif position.x == destination.d8.tele.x and position.y == destination.d8.tele.y and position.z == destination.d8.tele.z then
			p:teleportTo(destination.d8.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

		elseif position.x == destination.d9.tele.x and position.y == destination.d9.tele.y and position.z == destination.d9.tele.z then
			p:teleportTo(destination.d9.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		elseif position.x == destination.d10.tele.x and position.y == destination.d10.tele.y and position.z == destination.d10.tele.z then
			p:teleportTo(destination.d10.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		elseif position.x == destination.d11.tele.x and position.y == destination.d11.tele.y and position.z == destination.d11.tele.z then
			p:teleportTo(destination.d11.tele2)
			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
--		elseif position.x == destination.d12.tele.x and position.y == destination.d12.tele.y and position.z == destination.d12.tele.z then
--			p:teleportTo(destination.d12.tele2)
--			p:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
			
		end
return true
end

