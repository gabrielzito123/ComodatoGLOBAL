local destination = {
d1 = { tele = {x = 33003, y = 31918, z = 10}, tele2 = {x = 33008, y = 31921, z = 10} },
d2 = { tele = {x = 33007, y = 31921, z = 10}, tele2 = {x = 33002, y = 31918, z = 10} },
d3 = { tele = {x = 33001, y = 31918, z = 10}, tele2 = {x = 33008, y = 31921, z = 10} },
d4 = { tele = {x = 33002, y = 31918, z = 10}, tele2 = {x = 33008, y = 31921, z = 10} },
d5 = { tele = {x = 33009, y = 31918, z = 10}, tele2 = {x = 33008, y = 31921, z = 10} },
d6 = { tele = {x = 33001, y = 31918, z = 10}, tele2 = {x = 33008, y = 31921, z = 10} }
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
		end
return true
end

